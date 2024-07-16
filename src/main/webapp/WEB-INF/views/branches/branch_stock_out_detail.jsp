<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지점 관리 시스템</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/branches.css'/>">
</head>

<body>
	<%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
	<div class="content">
		<h1>출고</h1>
		<div class="form-group">
			<select>
				<option value="">교재 선택</option>
				<option value="book1">국어 기본서</option>
				<option value="book2">수학 문제집</option>
				<option value="book3">영어 단어장</option>
				<option value="book4">과학 실험서</option>
				<option value="book5">사회 참고서</option>
			</select> <input type="number" placeholder="수량" min="1" value="1">
			<button>출고 목록에 추가</button>
		</div>


		<button>출고 확인</button>

		<h2>출고 기록</h2>
		<table>
			<tr>
				<th>출고 번호</th>
				<th>날짜</th>
				<th>상태</th>
			</tr>
			<tr>
				<td>OUT001</td>
				<td>2024-07-05</td>
				<td>완료</td>
			</tr>
			<tr>
				<td>OUT002</td>
				<td>2024-07-04</td>
				<td>완료</td>
			</tr>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/branch_includes/footer.jsp"%>
</body>
</html>