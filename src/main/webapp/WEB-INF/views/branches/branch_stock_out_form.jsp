<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소비 페이지</title>
<style>
/* 이전 스타일 유지 */
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
	display: flex; /* flexbox 설정 */
	justify-content: space-between; /* 좌우 정렬 */
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

.order-form {
	margin-bottom: 20px;
}

.order-list {
	margin-top: 20px;
}

button {
	padding: 5px 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

/* 여기부터 중요함 살려야 함 */
.comments-section {
            margin-top: 10px;
}
.comment-box {
	width: 100%;
	height: 60px;
	margin-bottom: 10px;
}
.comment-box:disabled {
	background-color: #f0f0f0; /* 비활성화된 상태의 배경 색상 */
}

.modal {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px; /* 모달 창의 최대 너비 (변경 가능) */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
    border-radius: 8px; /* 둥근 모서리 */
    position: relative; /* 자식 요소의 절대 위치에 영향을 주기 위해 */
    max-height: 50vh;
    overflow-y: auto; /* 세로 스크롤 */
}
.modal-body {
    max-height: calc(80vh - 100px); /* 최대 높이 (모달 창 높이에서 버튼 높이 차감) */
    overflow-y: auto; /* 세로 스크롤 */
    margin-bottom: 20px; /* 버튼과의 거리 */
}
.close {
	color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
	color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
<script src="<c:url value= "/javascript/stockOut.js"/>"></script>

</head>

<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>

	<h1>출고 소비 페이지</h1>

		<form id="search-form">
			<label for="keyword">검색어: </label>
			<input type="text" name="keyword" value="${param.keyword == null ? '' : param.keyword.trim()}">
			<input type="submit" value="검색">
		</form>
			
		<div class="out-list">
			<table id="table">
				<tr>
					<th>교재명</th>
					<th>수량</th>
					<th>작업</th>
					<th>코멘트</th>
				</tr>
				<c:forEach items="${list }" var="vo" varStatus="status">
					<tr>
						<td>${vo.bookName }</td>
						<td>${vo.inventory }</td>
						<td>
							<input type="hidden" name="bookCode" value="${vo.bookCode}">
							<input type="hidden" name="bookName" value="${vo.bookName }">
							<input type="number" name="quantity" min="0" max="${vo.inventory}"
								data-book-code="${vo.bookCode}"
								data-book-name="${vo.bookName}"
								oninput="validateAndHandleQuantity(this, ${vo.inventory})">
						</td>
						<td>
                        	<textarea class="comment-box" data-book-code="${vo.bookCode}" placeholder="코멘트를 입력하세요"></textarea>
                    	</td>
					</tr>
				</c:forEach>
			</table>
			
			<form id="orderForm" action="<c:url value='/branch/stockout/confirm'/>" method="post">
				<button type="button" onclick="showConfirmationModal()">확정</button>
			</form>
		</div>
			
		<div id="confirmationModal" class="modal">
        	<div class="modal-content">
            	<span class="close" onclick="closeModal()">&times;</span>
            	<h2>소비 처리 확인</h2>
            	<div id="modal-body">
                <!-- JavaScript로 동적으로 내용이 추가됩니다. -->
            	</div>
            	<button type="button" onclick="submitOrderForm()">확인</button>
            	<button type="button" onclick="closeModal()">취소</button>
        	</div>
    	</div>
</body>
</html>
