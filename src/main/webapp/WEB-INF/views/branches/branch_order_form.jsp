<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h3 class="parent">
			<a href="<c:url value="/branch/order/list" />">발주 기록</a>
		</h3>
		<!-- 왼쪽 컨텐츠 -->
		<div class="cart">
			<div class="cart-content">
				<form id="addToCartForm" action="<c:url value='/branch/order/add'/>"
					method="post">
					
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="order-form">
						<select id="bookSelect" name="bookCode">
							<option value="">교재 선택</option>
							<c:forEach items="${list}" var="vo" varStatus="status">
								<option value="${vo.bookCode}">${vo.bookName}</option>
							</c:forEach>
						</select> <input type="number" name="quantity" id="quantity" min="1"
							max="100000" value="1">
						<button type="button" onclick="addToCart()" class="add">장바구니에
							추가</button>

					</div>
				</form>

				<table id="cartTable">
					<tr>
						<th>교재명</th>
						<th>수량</th>
						<th>예상 재고</th>
						<th>금액</th>
						<th>작업</th>
					</tr>
					<c:forEach items="${cartList}" var="vo" varStatus="status">
						<tr>
							<td>${vo.bookName}</td>
							<td>${vo.quantity}</td>
							<td>${vo.inventory + vo.quantity}</td>
							<td><fmt:formatNumber value="${vo.price * vo.quantity}"
									pattern="#,###" /></td>
							<td>
								<form onsubmit="return confirm('정말로 삭제하시겠습니까?');"
									action="<c:url value='/branch/order/remove'/>" method="post">
                        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
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
						<td colspan="2"><strong>${totalQuantity}</strong></td>
						<td colspan="2"><strong><fmt:formatNumber
									value="${totalPrice}" pattern="#,###" /></strong></td>
					</tr>
				</table>
				<div style="display: flex; justify-content: flex-end; gap: 10px;">
					<form action="<c:url value='/branch/order/removeall'/>"
						method="post">
						
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button type="submit" class="delete">전체 삭제</button>
					</form>
					<form id="orderForm" action="<c:url value='/branch/order/submit'/>"
						method="post">
						
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<button type="submit" onclick="return confirmSubmit()"
							class="update">발주 제출</button>
					</form>
				</div>
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
				
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table id="bookInventory">
					<tr>
						<th>교재명</th>
						<th>수량</th>
						<th>발주 수량</th>
					</tr>
					<c:forEach items="${list}" var="vo" varStatus="status">
						<tr>
							<td><input type="hidden" name="bookCodes"
								value="${vo.bookCode}">${vo.bookName}</td>
							<td>${vo.inventory}</td>
							<td><input type="number" name="quantities"
								class="quantity-input" min="0" max="100000" value="0"
								oninput="updateExpectedStock(this, ${vo.inventory})"></td>
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
				
			</script>


		</div>
	</div>
</body>
</html>
