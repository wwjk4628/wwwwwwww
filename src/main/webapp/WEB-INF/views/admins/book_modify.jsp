<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>본사 관리 시스템</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/admins.css'/>">
</head>
<body>
	<%@ include file="/WEB-INF/views/admin_includes/navigation.jsp"%>

	<div class="content">
		<form action="<c:url value='/admin/book/modify'/>" method="POST">

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="bookCode"
				value="${vo.bookCode }" />
			<table>
				<tr>
					<th>교재명</th>
					<th>가격</th>
					<th>과목 코드</th>
					<th>작업</th>
				</tr>
				<tr>
					<td><input type="text" name="bookName" value="${vo.bookName }"
						id="bookNameInput" maxlength="50" oninput="validateBookName(this)"></td>
					<td><input type="number" name="price" id="priceInput" value="${vo.price }"
						oninput="handleQuantityInput(this)"></td>
					<td><input type="number" name="kindCode" id="kindInput"
						value="${vo.kindCode }" oninput="handleQuantityInput(this)"></td>
					<td><button type="button" onclick="addToBookList()"
							class="add">수정</button></td>
				</tr>

			</table>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/admin_includes/footer.jsp"%>

	<script type="text/javascript">
		function addToBookList() {
			var bookName = document.getElementsByName("bookName")[0].value;
			var price = document.getElementById("priceInput").value;
			var kindCode = document.getElementById("kindInput").value;

			// 교재 코드 확인

			// 교재명 확인
			if (bookName.trim() === "") {
				alert("교재명을 입력해 주세요.");
				return;
			}

			// 가격 확인
			if (price.trim() === "" || isNaN(price) || parseFloat(price) <= 0) {
				alert("올바른 가격을 입력해주세요.");
				return;
			}

			// 과목 코드 확인
			if (kindCode.trim() === "" || isNaN(kindCode)
					|| parseFloat(kindCode) <= 0) {
				alert("과목 코드를 입력해 주세요.");
				return;
			}

			if (!isNumber(kindCode)) {
				alert("과목 코드는 숫자만 입력해주세요.");
				return;
			}

			// 가격이 숫자인지 검사
			if (!isNumber(price)) {
				alert("가격은 숫자만 입력해주세요.");
				return;
			}

			// 폼 제출
			var form = document.getElementById("addToBookList");
			form.submit();
		}

		// 숫자인지 확인하는 함수
		function isNumber(value) {
			return /^\d+$/.test(value);
		}

		function handleQuantityInput(input) {
			// 입력된 값을 정수로 변환합니다.
			let value = parseInt(input.value, 10);

			// 최소값(min)과 최대값(max) 사이의 값으로 제한합니다.
			if (isNaN(value)) {
				value = 0; // 숫자가 아니거나 값이 없으면 기본값으로 1을 설정합니다.
			} else {
				value = Math.min(Math.max(value, 0), 9999999);
			}

			// 제한된 값을 입력 필드에 반영합니다.
			input.value = value;
		}

		function validateBookName(input) {
			var bookName = input.value.trim();

			// 입력 값이 50자를 초과하는 경우
			if (bookName.length > 50) {
				alert("교재명은 최대 50자까지 입력 가능합니다.");
			}
		}
	</script>
</body>
</html>
