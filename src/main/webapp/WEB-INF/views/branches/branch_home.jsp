<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <%@ include file="/WEB-INF/views/branch_includes/navigation.jsp" %>
    <div class="content">
        <h1>branch id: ${authUser.branchId }의 교재 재고 현황</h1>
        <h3>목록 (검색어: ${param.keyword })</h3>
		<form id="search-form">
			<label for="keyword">검색어</label> <input type="text" name="keyword">
			<input type="submit" value="검색">
			<input type="checkbox" name="check" id="check" value="check" />
            <label for="check">재고</label>
		</form>	<br/>
        <table border="1">
				<tr>
					<th>book_code</th>
					<th>book_name</th>
					<th>inventory</th>
				</tr>
					
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.bookCode}</td>
						<td>${vo.bookName}</td>
						<td>${vo.inventory}</td>
					</tr>
				</c:forEach>
			</table>
			<p><a href ="<c:url value = "/order/list"/>">오더 리스트 보기</a></p>
    </div>
</body>
</html>