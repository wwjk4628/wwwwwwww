<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav>
    <ul>
        <li><a href="<%=request.getContextPath()%>/admins/main">본사 홈</a></li>
        <li><a href="<%=request.getContextPath()%>/order/check">발주 승인</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/booklist">교재 관리</a></li>
        <li><a href="<%=request.getContextPath()%>/usermanage/list">회원 승인</a></li>
    </ul>
</nav>