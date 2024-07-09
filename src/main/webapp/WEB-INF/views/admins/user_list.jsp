<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <h1>회원 승인 히스토리</h1>
        <h3><a href="/admins/confirm_list.html">회원 승인</a></h3>
        <p>유저리스트</p>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>지점 번호</th>
					<th>auth code</th>
					<th>비고</th>
				</tr>
					
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.no }</td>
						<td>${vo.name }</td>
						<td>${vo.branchId }</td>
						<td>
            				<c:choose>
                				<c:when test="${vo.authCode eq 0}">승인 대기</c:when>
                				<c:when test="${vo.authCode eq 1}">지점 담당자</c:when>
                				<c:when test="${vo.authCode eq 2}">관리자</c:when>
                				<c:otherwise>알 수 없음</c:otherwise>
           					</c:choose>
        				</td>
        				<td>
        					<c:choose>
        						<c:when test="${vo.authCode eq 0}"><a href = "<c:url value="/usermanage/${vo.no }/confirm"/>">승인</a></c:when>
        					</c:choose>
        					<c:choose>
                				<c:when test="${vo.authCode eq 0 || vo.authCode eq 1}"><a href = "<c:url value="/usermanage/${vo.no }/delete"/>">삭제</a></c:when>
                				<c:otherwise>비워뒀음</c:otherwise>
           					</c:choose>
        				</td>
					</tr>
				</c:forEach>
			</table>
			<a href="<c:url value="/admins"/>">admin 홈으로 돌아가기</a>
    </div>
</body>

</html>