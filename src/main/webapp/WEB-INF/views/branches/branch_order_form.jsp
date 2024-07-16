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
		<div class="cart">
			<div class="cart-content">
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
						<c:set var="totalQuantity"
							value="${totalQuantity + (vo.quantity)}" />
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
		</div>
		<div>




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
			<form id="addToCartForm2"
				action="<c:url value='/branch/order/addMultiple'/>" method="post">
				<table id="bookInventory">
					<tr>
						<th>교재명</th>
						<th>수량</th>
						<th>발주 수량</th>
						<th>예상 재고</th>
					</tr>
					<c:forEach items="${list}" var="vo" varStatus="status">
						<tr>
							<td><input type="hidden" name="bookCodes"
								value="${vo.bookCode}">${vo.bookName}</td>
							<td>${vo.inventory}</td>
							<td><input type="number" name="quantities"
								class="quantity-input" min="0" value="0"></td>
							<td>수량</td>
						</tr>
					</c:forEach>
				</table>
				<div class="cart2">
					<div class="cart-content2">
						<button type="button" onclick="addToCart2()" class="add">한번에
							장바구니 추가</button>
					</div>
				</div>
			</form>

			<script src="<c:url value='/javascript/setting.js'/>"></script>
			<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>

			<script>
				function addToCart2() {
					var form = document.getElementById("addToCartForm2");
					var quantities = document
							.querySelectorAll(".quantity-input");

					var anyQuantitySelected = false;
					for (var i = 0; i < quantities.length; i++) {
						if (quantities[i].value > 0) {
							anyQuantitySelected = true;
							break;
						}
					}

					if (!anyQuantitySelected) {
						alert("최소 한 권 이상의 교재를 선택해야 합니다.");
						return;
					}
					// 모든 입력 필드들을 순회하면서 수량이 0 이상인 경우만 폼 데이터에 추가
					for (var i = 0; i < quantities.length; i++) {
						var quantity = quantities[i].value;
						if (quantity > 0) {
							// 수량이 0보다 큰 경우에는 문제없이 넘어갑니다.
							continue;
						} else {
							// 수량이 0 이하인 경우 해당 행을 삭제하거나 다른 처리를 수행할 수 있습니다.
							// 여기서는 간단히 해당 행을 삭제하는 예시를 보여줍니다.
							quantities[i].parentNode.parentNode.remove();
						}
					}

					// 최소 한 권 이상의 교재를 선택하지 않은 경우 경고창을 띄우고 폼 제출을 막습니다.

					// 수정된 폼을 서버로 제출
					form.submit();
				}
			</script>
</body>
</html>
