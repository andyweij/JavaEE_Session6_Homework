<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Backend</title>
	<script type="text/javascript">
		
	</script>
</head>
<body>
<%@ include file="BackendMenu.jsp" %>
<br/><br/><HR>		
	<h2>商品新增</h2><br/>
	<div style="margin-left:25px;">
	<p style="color:blue;">${sessionScope.createMsg}</p>
	<% session.removeAttribute("createMsg"); %>
	<form action="BackendAction.do?action=addGoods" enctype="multipart/form-data" method="post">
		<p>
			商品名稱:
			<input type="text" name="goodsName" size="10"/>
		</p>		
		<p>
			設定價格： 
			<input type="text" name="goodsPrice" size="10"/>
		</p>
		<p>
			上架數量：
			<input type="text" name="goodsQuantity" size="10"/>
		</p>
		<p>
			商品圖片：
			<input type="file" name="goodsImage" />			
		</p>
		<p>
			商品狀態：
			<select name="status">
				<option value="1">上架</option>
				<option value="0">下架</option>				
			</select>			
		</p>
		<p>
			<input type="submit" value="新增">
		</p>
	</form>
	</div>

</body>
</html>