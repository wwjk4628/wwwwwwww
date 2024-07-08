<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    
<!-- 관리자 디폴트 페이지: admin_includes폴더의 header, navigation, footer 포함
교재 주문목록과 계정 승인요청 브리핑 -->

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <!-- Main content: 교재 주문목록과 계정 승인요청 브리핑 -->
    <div class="content">
        <h1>교재 주문목록</h1>
        <!-- 교재 주문목록 내용 -->
        
        <h1>계정 승인요청</h1>
		<a href = "<c:url value="/usermanage/list"/>">보러 가기</a>
    </div>
    
    <!-- Include footer -->
    <%@ include file="/WEB-INF/views/admin_includes/footer.jsp" %>
</body>
</html>