<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    
<!-- 관리자 디폴트 페이지: admin_includes폴더의 header, navigation, footer 포함
교재 주문목록과 계정 승인요청 브리핑 -->

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
   <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp" %>
    
    <!-- Main content: 교재 주문목록과 계정 승인요청 브리핑 -->
    <div class="content">
        <h1>교재 주문목록</h1>
        <!-- 교재 주문목록 내용 -->
        
        <h1>계정 승인요청</h1>
        <!-- 계정 승인요청 내용 -->
    </div>
    
    <!-- Include footer -->
    <%@ include file = "/admin_includes/footer.html" %>
</body>
</html>