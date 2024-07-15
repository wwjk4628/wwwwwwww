<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>발주 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">

</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<div class="content">
		<h1>발주 페이지</h1>
		<h3>
			<a href="<c:url value="/branch/order/list" />">발주 기록</a>
		</h3>

		<!-- 왼쪽 컨텐츠 -->

		<form id="addToCartForm" action="<c:url value='/branch/order/add'/>"
			method="post">
			<!-- <input type="text" id="bookSearch" placeholder="교재 검색..."> -->
			<div class="order-form">
				<select id="bookSelect" name="bookCode">
					<option value="">교재 선택</option>
					<c:forEach items="${list }" var="vo" varStatus="status">
						<option value="${vo.bookCode }">${vo.bookName }</option>
					</c:forEach>
				</select> <input type="number" name="quantity" id="quantity" min="1"
					value="1">
				<button type="button" onclick="addToCart()" class="add">장바구니에
					추가</button>
			</div>
		</form>

		<div class="order-list">
			<table id="cartTable">
				<tr>
					<th>교재명</th>
					<th>수량</th>
					<th>금액</th>
					<th>작업</th>
				</tr>
				<c:forEach items="${cartList }" var="vo" varStatus="status">
					<tr>
						<td>${vo.bookName }</td>
						<td>${vo.quantity }</td>
						<td>${vo.price * vo.quantity}</td>
						<td>
							<form onsubmit="return confirm('정말로 삭제하시겠습니까?');"
								action="<c:url value='/branch/order/remove'/>" method="post">
								<input type="hidden" name="bookCode" value="${vo.bookCode}">
								<button type="submit" class="delete">삭제</button>
							</form>
						</td>
					</tr>
					<c:set var="totalQuantity" value="${totalQuantity + (vo.quantity)}" />
					<c:set var="totalPrice"
						value="${totalPrice + (vo.price * vo.quantity)}" />
				</c:forEach>
				<tr>
					<td><strong>총합</strong></td>
					<td><strong>${totalQuantity}</strong></td>
					<td><strong>${totalPrice}</strong></td>
					<td>
						<form id="orderForm"
							action="<c:url value='/branch/order/submit'/>" method="post">
							<button type="submit" onclick="return confirmSubmit()"
								class="update">발주 제출</button>
						</form>
					</td>
				</tr>
			</table>
		</div>


		<!-- 오른쪽 컨텐츠 -->

		<form action="<c:url value="/branch/order/search" />" method="GET">
			<table border="1" width="100%">
				<tr>
					<th>교재명</th>
					<td><input type="text" name="bookName" value="${bookName }"></td>
					<td><input type="submit" value="검색"></td>
				</tr>
			</table>
		</form>
		<br>
		<table id="bookInventory">
			<tr>
				<th>교재명</th>
				<th>수량</th>
			</tr>
			<c:forEach items="${list }" var="vo" varStatus="status">
				<tr>
					<td>${vo.bookName }</td>
					<td>${vo.inventory }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script src="<c:url value='/javascript/setting.js'/>"></script>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>
