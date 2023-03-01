<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BackEnd</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@ include file="BackendMenu.jsp"%>
	<br />
	<br />
	<HR>
	<h2>商品列表</h2>
	<br />
	<div style="margin-left: 25px;">
		<table border="1">
			<tbody>
				<tr height="50" align="center">
					<td width="100"><b>商品編號</b></td>
					<td width="100"><b>商品名稱</b></td>
					<td width="100"><b>商品價格</b></td>
					<td width="100"><b>商品庫存</b></td>
					<td width="100"><b>商品狀態</b></td>
				</tr>
				<c:forEach items="${goods}" var="goods">
					<tr height="30" align="center">
						<td>${goods.goodsID}</td>
						<td>${goods.goodsName}</td>
						<td>${goods.goodsPrice}</td>
						<td>${goods.goodsQuantity}</td>
						<td>${goods.status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>