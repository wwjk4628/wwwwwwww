
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav>
	<ul>
		<li><a href="<%=request.getContextPath()%>/branch/inventory">교재 재고</a></li>
		<li><a href="<%=request.getContextPath()%>/branch/order/form">발주</a></li>
		<li><a href="<%=request.getContextPath()%>/branch/stockin/list">입고</a></li>
		<li><a href="<%=request.getContextPath()%>/branch/stockout/list">출고</a></li>
	</ul>
</nav>