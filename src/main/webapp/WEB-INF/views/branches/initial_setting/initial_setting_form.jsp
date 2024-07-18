<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>초기 재고 설정 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">
<script src="<c:url value= "/javascript/setting.js"/>"></script>

</head>

<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<h1>재고 설정 페이지</h1>

	<form id="addToCartForm" action="<c:url value='/branch/initial/add'/>"
		method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="text" id="bookSearch" placeholder="교재 검색...">
		<div class="order-form">
			<select id="bookSelect" name="bookCode">
				<option value="">교재 선택</option>
				<c:forEach items="${initialList }" var="vo" varStatus="status">
					<option value="${vo.bookCode }">${vo.bookName }</option>
				</c:forEach>
			</select> <input type="number" name="quantity" id="quantity" min="1" value="1">
			<button type="button" onclick="addToCart()" class="add">장바구니에 추가</button>
		</div>
	</form>

	<div class="order-list">
		<table id="cartTable">
			<tr>
				<th>교재명</th>
				<th>수량</th>
				<th>작업</th>
			</tr>
			<c:forEach items="${initialCart }" var="vo" varStatus="status">
				<tr>
					<td>${vo.bookName }</td>
					<td>${vo.quantity }</td>
					<td>
						<form action="<c:url value="/branch/initial/delete"/>"
							method="post">
							
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden" name="bookCode" value="${vo.bookCode}">
							<button type="submit"  class="delete">삭제</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
		<form id="orderForm" action="<c:url value='/branch/initial/confirm'/>"
			method="post">
			
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" onclick="submitOrderForm()"  class="update">발주 제출</button>
		</form>
	</div>

</body>

</html>
