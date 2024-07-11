<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본사 관리 시스템</title>
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
            margin-bottom: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
        }

        .approve {
            background-color: #4CAF50;
            color: white;
        }

        .reject {
            background-color: #f44336;
            color: white;
        }

        .add {
            background-color: #008CBA;
            color: white;
        }
    </style>
</head>

<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp" %>

    <div class="content">
        <h1>${id }번 발주 디테일</h1>
        <h3><a href="<c:url value="/order/check/list"/>">발주 리스트 돌아가기</a></h3>
        <table border="1">
				<tr>
					<th>order_id</th>
					<th>branch_id</th>
					<th>order_date</th>
					<th>book_code</th>
					<th>quantity</th>
					<th>book_name</th>
					<th>order_check</th>
					<th>상세보기</th>
				</tr>
					
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.orderId}</td>
						<td><a href="<c:url value="/order/check/${vo.branchId }/list"/>">${vo.branchId}</a></td>
						<td>${vo.orderDate}</td>
						<td>${vo.bookCode}</td>
						<td>${vo.quantity}</td>
						<td>${vo.bookName}</td>
						<td><c:choose>
                			<c:when test="${vo.checked eq 0}">미확인</c:when>
                			<c:when test="${vo.checked eq 1}">반려</c:when>
                			<c:when test="${vo.checked eq 2}">처리 완료</c:when>
                			<c:otherwise>알 수 없음</c:otherwise>
           				</c:choose></td>
						
						<td><a href = "<c:url value="/order/check/${vo.orderId }/detail"/>">보러 가기</a></td>
					</tr>
				</c:forEach>
			</table>
    </div>
</body>
</html>