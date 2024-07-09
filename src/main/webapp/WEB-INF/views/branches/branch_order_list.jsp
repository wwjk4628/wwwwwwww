<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<div class="content">
		<h1>발주 페이지</h1>

		<h3>
			<a href="<c:url value="/orderhistory" />">발주 기록</a>
		</h3>

		<input type="text" id="bookSearch" placeholder="교재 검색...">
		<div class="order-form">
			<select id="bookSelect">
				<option value="">교재 선택</option>
				<c:forEach items="${list }" var="vo" varStatus="status">
					<option value="${vo.book_code }">${vo.book_name }</option>
				</c:forEach>
			</select> <input type="number" id="quantity" min="1" value="1">
			<button onclick="addToCart()">장바구니에 추가</button>
		</div>

		<div class="order-list">
			<table id="cartTable">
				<tr>
					<th>교재명</th>
					<th>수량</th>
					<th>작업</th>
				</tr>
			</table>
			<button onclick="submitOrder()">발주 제출</button>
		</div>

	</div>

	<script>
		function addToCart() {
			var bookSelect = document.getElementById("bookSelect");
			var quantityInput = document.getElementById("quantity");
			var bookName = bookSelect.options[bookSelect.selectedIndex].text;
			var quantity = quantityInput.value;

			var table = document.getElementById("cartTable");
			var newRow = table.insertRow(-1); // Insert new row at the end

			var cell1 = newRow.insertCell(0); // Insert cells
			var cell2 = newRow.insertCell(1);
			var cell3 = newRow.insertCell(2);

			cell1.innerHTML = bookName; // Set cell content
			cell2.innerHTML = quantity;
			cell3.innerHTML = '<button onclick="deleteRow(this)">삭제</button>'; // Add delete button
		}

		function deleteRow(btn) {
			var row = btn.parentNode.parentNode; // Get the row to be deleted
			row.parentNode.removeChild(row); // Remove the row
		}

		function submitOrder() {
			// Implement submit order functionality
			alert("발주를 제출합니다!");
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
