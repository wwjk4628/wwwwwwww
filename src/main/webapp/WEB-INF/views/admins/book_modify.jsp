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
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>

    <div class="content">
        <form action="<c:url value='/admin/book/modify'/>" method="POST">
            <input type="hidden" name="bookCode" value="${vo.bookCode }" />
            <table>
                <tr>
                    <th>교재명</th>
                    <th>가격</th>
                    <th>과목 코드</th>
                    <th>작업</th>
                </tr>
                <tr>
                    <th><input type="text" name="bookName"value="${vo.bookName }"></th>
                    <th><input type="text" name="price" value="${vo.price }"></th>
                    <th><input type="text" name="kindCode" value="${vo.kindCode }"></th>
                    <th><input type="submit" value="수정"></th>
                </tr>
            </table>
        </form>
    </div>

    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp" %>
</body>
</html>
