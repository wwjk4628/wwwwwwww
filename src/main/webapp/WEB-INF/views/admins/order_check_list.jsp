<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본사 관리 시스템</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/admins.css'/>">
</head>
<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp" %>

    <div class="content">
        <h1>발주 승인</h1>
        <h3><a href="<c:url value='/admin/ordercheck'/>">초기화</a></h3>
        <table>
            <tr>
                <th>order_id</th>
                <th>branch_id</th>
                <th>order_date</th>
                <th>order_check</th>
                <th>상세보기</th>
            </tr>
            <c:forEach items="${list}" var="vo">
                <tr>
                    <td>${vo.orderId}</td>
                    <td><a href="<c:url value='/admin/ordercheck/list/${vo.branchId}'/>">${vo.branchId}</a></td>
                    <td>${vo.orderDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${vo.checked eq 0}">미확인</c:when>
                            <c:when test="${vo.checked eq 1}">반려</c:when>
                            <c:when test="${vo.checked eq 2}">처리 완료</c:when>
                            <c:otherwise>알 수 없음</c:otherwise>
                        </c:choose>
                    </td>
                    <td><a href="<c:url value='/admin/ordercheck/detail/${vo.orderId}'/>">보러 가기</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp" %>
</body>
</html>
