<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BackEnd</title>
<script type="text/javascript"></script>
</head>
<body>
	<%@ include file="BackendMenu.jsp"%>
	<br /><br /><HR>
	<h2>銷售報表</h2>
	<br />
	<div style="margin-left: 25px;">
		<form action="BackendAction.do" method="get">
		<input type="hidden" name="action" value="querySalesReport"/>
		起 &nbsp; <input type="date" name="queryStartDate" style="height:25px;width:180px;font-size:16px;text-align:center;"/>
		&nbsp;
		迄 &nbsp; <input type="date" name="queryEndDate" style="height:25px;width:180px;font-size:16px;text-align:center;"/>	
		<input type="submit" value="查詢" style="margin-left:25px; width:50px;height:32px"/>
	</form>
	<table border="1">
		<tbody>
			<tr height="50">
				<td width="100"><b>訂單編號</b></td>
				<td width="100"><b>顧客姓名</b></td>
				<td width="100"><b>購買日期</b></td>
				<td width="125"><b>飲料名稱</b></td> 
				<td width="100"><b>購買單價</b></td>
				<td width="100"><b>購買數量</b></td>
				<td width="100"><b>購買金額</b></td>
			</tr>
			<c:forEach items="${salesreport}" var="salesreport">
					<tr height="30" align="center">
						<td>${salesreport.orderID}</td>
						<td>${salesreport.customerName}</td>
						<td>${salesreport.orderDate}</td>
						<td>${salesreport.goodsName}</td>
						<td>${salesreport.goodsBuyPrice}</td>
						<td>${salesreport.buyQuantity}</td>
						<td>${salesreport.buyAmount}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
	</div>
</body>
</html>