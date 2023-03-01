package com.training.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.training.formbean.GoodsOrderForm;
import com.training.model.Goods;
import com.training.model.Member;
import com.training.service.FrontendService;
import com.training.vo.BuyGoodsRtn;

public class FrontendAction extends DispatchAction{
	private FrontendService frontendservice = FrontendService.getInstance();
	
	public ActionForward buyGoods(ActionMapping mapping, ActionForm form, 
            HttpServletRequest req, HttpServletResponse resp) throws IOException {
		GoodsOrderForm goodsorderform=(GoodsOrderForm)form;	
		
		BuyGoodsRtn buyRtn=new BuyGoodsRtn();
		HttpSession session = req.getSession();
		Member mem=(Member)session.getAttribute("member");
		buyRtn.setCustomerId(mem.getIdentificationNo());
		buyRtn.setPayprice(goodsorderform.getInputMoney());
		buyRtn.setCarGoods((LinkedHashMap) session.getAttribute("carGoods"));
		if(buyRtn.getCarGoods()==null) {
			return mapping.findForward("vendingMachine");
		}
		goodsorderform.setCustomerID(mem.getIdentificationNo());
		
		Map<String, Goods> queryBuyGoods = frontendservice.queryBuyGoods(buyRtn.getCarGoods());// 查詢購買品項資料庫資訊	
		BuyGoodsRtn buygoodsRtn = frontendservice.priceCalc(buyRtn, queryBuyGoods);//檢查金額是否足夠
		
		if (buygoodsRtn.getPayprice()>=buygoodsRtn.getTotalsprice()) {			
			Set<Goods> goodsOrders = frontendservice.createGoodsOrder(buyRtn); //建立訂單
			boolean updateresult = frontendservice.buyGoods(goodsOrders); //更新商品庫存
			System.out.println(buygoodsRtn.toString());
		} else {

			System.out.println(buygoodsRtn.toString());
		}
		req.setAttribute("buygoodsrtn", buygoodsRtn);
		session.removeAttribute("carGoods");
		return mapping.findForward("vendingMachine");
	}
	public ActionForward searchGoods(ActionMapping mapping, ActionForm form, 
        HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String pageNo = "";
		String searchKeyword ="";			
		List<Goods> pagination = frontendservice.pageSearch(searchKeyword, pageNo);
		BigDecimal pagecount=new BigDecimal(pagination.size()).divide(new BigDecimal("6"),0, RoundingMode.UP);	
		req.setAttribute("pagecount", pagecount);
		GoodsOrderForm goodsorderform=(GoodsOrderForm)form;
		pageNo = goodsorderform.getPageNo();
		searchKeyword = goodsorderform.getSearchKeyword();
		if(null==searchKeyword&&null==pageNo) {
			searchKeyword="";
			pageNo="1";
		}else if(null==searchKeyword){
			searchKeyword="";
		}
		List<Goods> pagesearch = frontendservice.pageSearch(searchKeyword, pageNo);
		req.setAttribute("pagesearch", pagesearch);
		pagesearch.stream().forEach(p -> System.out.println(p.toString()));	
		return mapping.findForward("vendingMachine");
	}
	public ActionForward pagination(ActionMapping mapping, ActionForm form, 
	        HttpServletRequest req, HttpServletResponse resp) throws IOException {			
			String pageNo = "";
			String searchKeyword ="";			
			List<Goods> pagination = frontendservice.pageSearch(searchKeyword, pageNo);
			int pagecount=pagination.size()/6;		
			req.setAttribute("pagecount", pagecount);
			return mapping.findForward("vendingMachine");
		}

}
