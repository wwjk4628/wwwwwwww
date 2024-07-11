
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav>
	<ul>
		<li><a href="<%=request.getContextPath()%>/branches">교재 재고</a></li>
		<li><a href="<%=request.getContextPath()%>/orderlist">발주</a></li>
		<li><a href="/branches/branch_stock_in_list.jsp">입고</a></li>
		<li><a href="<%=request.getContextPath()%>/branch/stock_out_list">출고</a></li>
</nav>