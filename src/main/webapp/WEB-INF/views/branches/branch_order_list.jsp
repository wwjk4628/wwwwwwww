<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>발주 페이지</title>
<style>
/* 이전 스타일 유지 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

nav {
	background-color: #333;
	padding: 10px;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul li {
	display: inline;
	margin-right: 20px;
}

nav ul li a {
	color: white;
	text-decoration: none;
}

.content {
	padding: 20px;
	display: flex; /* flexbox 설정 */
	justify-content: space-between; /* 좌우 정렬 */
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.order-form {
	margin-bottom: 20px;
}

.order-list {
	margin-top: 20px;
}

button {
	padding: 5px 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

.left-content {
	width: 48%;
	overflow-y: auto;
	height: calc(100vh - 280px); /* Adjust height as needed */
	max-height: calc(100vh - 280px); /* Adjust max-height as needed */
}

.right-content {
	width: 48%;
	overflow-y: auto;
	height: calc(100vh - 280px); /* Adjust height as needed */
	max-height: calc(100vh - 280px); /* Adjust max-height as needed */
}

/* 발주 기록 스타일 */
.order-history {
	margin-top: 0;
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<h1>발주 페이지</h1>
	<h3>
		<a href="<c:url value="/orderhistory" />">발주 기록</a>
	</h3>
	<div class="content">

		<!-- 왼쪽 컨텐츠 -->
		<div class="left-content">
			<form id="addToCartForm" action="<c:url value='/add-to-cart'/>"
				method="post">
				<input type="text" id="bookSearch" placeholder="교재 검색...">
				<div class="order-form">
					<select id="bookSelect" name="bookCode">
						<option value="">교재 선택</option>
						<c:forEach items="${list }" var="vo" varStatus="status">
							<option value="${vo.book_code }">${vo.book_name }</option>
						</c:forEach>
					</select> <input type="number" name="quantity" id="quantity" min="1"
						value="1">
					<button type="button" onclick="addToCart()">장바구니에 추가</button>
				</div>
			</form>

			<div class="order-list">
				<table id="cartTable">
					<tr>
						<th>교재명</th>
						<th>수량</th>
						<th>작업</th>
					</tr>
					<c:forEach items="${cartList }" var="vo" varStatus="status">
						<tr>
							<td>${vo.book_name }</td>
							<td>${vo.quantity }</td>
							<td>
								<form action="remove-from-cart" method="post">
									<input type="hidden" name="bookCode" value="${vo.book_code}">
									<button type="submit">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
				<form id="submitOrderForm" action="<c:url value='/ordering'/>"
					method="post">
					<button type="button">발주 제출</button>
				</form>
			</div>
		</div>

		<!-- 오른쪽 컨텐츠 -->
		<div class="right-content">
			<form action="<c:url value="/admin/searchbooks" />" method="GET">
				<table border="1" width="100%">
					<tr>
						<th>교재명</th>
						<td><input type="text" name="book_name"></td>
						<td><input type="submit" value="검색"></td>
					</tr>
				</table>
			</form>
			<br>
			<table id="bookInventory">
				<tr>
					<th>교재명</th>
					<th>교재 코드</th>
				</tr>
				<c:forEach items="${list }" var="vo" varStatus="status">
					<tr>
						<td>${vo.book_name }</td>
						<td>${vo.book_code }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<script>
		function addToCart() {
			var bookSelect = document.getElementById("bookSelect");
			var quantity = document.getElementById("quantity").value;

			// 교재 선택 여부 확인
			if (bookSelect.value === "") {
				alert("교재를 선택해주세요.");
				return; // 교재를 선택하지 않으면 함수 종료
			}

			// 장바구니 추가 알림
			alert("장바구니에 상품이 추가되었습니다.");

			// 폼을 제출하지 않도록 preventDefault() 호출
			event.preventDefault(); // 폼 제출 방지

			// 추가 로직 (필요하면 추가)

			// 폼을 제출하는 방식으로 변경
			var form = document.getElementById("addToCartForm");
			form.submit();
		}


		function filterBooks() {
			var input, filter, select, options, option, i, txtValue;
			input = document.getElementById("bookSearch");
			filter = input.value.toUpperCase();
			select = document.getElementById("bookSelect");
			options = select.getElementsByTagName("option");

			for (i = 0; i < options.length; i++) {
				option = options[i];
				txtValue = option.textContent || option.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					option.style.display = "";
				} else {
					option.style.display = "none";
				}
			}
		}

		// 검색 필드에 입력이 들어올 때마다 호출되도록 이벤트 핸들러 설정
		document.getElementById("bookSearch").addEventListener("input",
				filterBooks);
	</script>
</body>
</html>
