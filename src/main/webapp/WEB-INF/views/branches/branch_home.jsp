<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지점 관리 시스템</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/branches.css'/>">
</head>
<body>
    <%@ include file="/WEB-INF/views/branch_includes/navigation.jsp" %>
    <div class="content">
        <h1>branch id: ${authUser.branchId }의 교재 재고 현황</h1>
        <h3>목록 (검색어: ${param.keyword })</h3>
        <form id="search-form">
            <label for="keyword">검색어</label> 
            <input type="text" name="keyword">
            <input type="submit" value="검색">
            <input type="checkbox" name="check" id="check" value="check" />
            <label for="check">재고</label>
        </form> 
        <br/>
        <table>
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
        <p><a href="<c:url value='/branch/order/list'/>">오더 리스트 보기</a></p>
    </div>
</body>
</html>
