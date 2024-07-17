
function addToCart() {
	var bookCode = document.getElementById("bookSelect").value;
	var quantity = document.getElementById("quantity").value;

	// 교재 선택 여부 확인
	if (bookCode === "") {
		alert("교재를 선택해주세요.");
		return;
	}

	// 수량 확인
	if (quantity < 1 || isNaN(quantity) || quantity.trim() === "") {
		alert("올바른 수량을 입력해주세요.");
		return;
	}

	// 수량 제한 확인
	var maxQuantity = 100000;
	if (quantity > maxQuantity) {
		alert("최대 발주 수량은 100,000개입니다. 다시 입력해주세요.");
		return;
	}

	// 장바구니 추가 알림
	alert("장바구니에 상품이 추가되었습니다.");

	// 폼 제출
	var form = document.getElementById("addToCartForm");
	form.submit();
}

/* function filterBooks() {
	var input, filter, select, options, option, i, txtValue;
	input = document.getElementById("bookSearch");
	filter = input.value.toUpperCase();
	select = document.getElementById("bookSelect");
	options = select.getElementsByTagName("option");

	for (i = 0; i < options.length; i++) {
		option = options[i];
		txtValue = option.textContent || option.innerText;
		if (txtValue.toUpperCase().indexOf(filter) > -1) {
			option.style.display = "";
		} else {
			option.style.display = "none";
		}
	}
} */


function confirmSubmit() {
	// 장바구니 테이블의 행 수를 가져옵니다
	var cartRows = document.querySelectorAll("#cartTable tr").length;

	// 만약 테이블에 행이 하나도 없다면
	if (cartRows <= 2) { // 테이블에는 헤더 행만 있으므로 길이는 1입니다
		alert("장바구니에 교재를 추가해야 발주를 제출할 수 있습니다.");
		return false; // 발주 제출을 막습니다
	}

	// 발주 제출 전에 사용자에게 확인 메시지를 표시합니다
	var confirmed = confirm('정말로 제출하시겠습니까?');
	return confirmed;
}

function updateExpectedStock(input, inventory) {
	var quantity = parseInt(input.value);
	var row = input.parentNode.parentNode; // 해당 input 태그가 속한 tr 요소
	var expectedStockCell = row
		.querySelector(".expected-stock");

	if (!isNaN(quantity) && quantity >= 0) {
		expectedStockCell.textContent = (inventory + quantity)
			.toString();
	} else {
		expectedStockCell.textContent = inventory.toString();
	}
}

function addToCart2() {
	var form = document.getElementById("addToCartForm2");
	var quantities = document
		.querySelectorAll(".quantity-input");

	var anyQuantitySelected = false;
	for (var i = 0; i < quantities.length; i++) {
		if (quantities[i].value > 0) {
			anyQuantitySelected = true;
			break;
		}
	}

	if (!anyQuantitySelected) {
		alert("최소 한 권 이상의 교재를 선택해야 합니다.");
		return;
	}
	// 장바구니 추가 알림
	alert("장바구니에 상품이 추가되었습니다.");

	form.submit();
}

// 검색 필드에 입력이 들어올 때마다 호출되도록 이벤트 핸들러 설정
document.getElementById("bookSearch").addEventListener("input",
	filterBooks);