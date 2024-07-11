<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지점 관리 시스템</title>
<style>
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
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<div class="content">
		<div class="order-history">
			<h2>발주 기록</h2>
			<h3>
				<a href="<c:url value="/orderlist" />">발주</a>
			</h3>
			<table>
				<tr>
					<th>책 이름</th>
					<th>가격</th>
					<th>수량</th>
				</tr>
				<c:forEach items="${list }" var="vo" varStatus="status">
					<tr>
						<td>${vo.orderId }</td>
						<td>${vo.bookCode }</td>
						<td>${vo.quantity }</td>

					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>