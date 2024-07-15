

function addToCart() {
			var bookSelect = document.getElementById("bookSelect");
			var quantity = document.getElementById("quantity").value;

			// 교재 선택 여부 확인
			if (bookSelect.value === "") {
				alert("교재를 선택해주세요.");
				return; // 교재를 선택하지 않으면 함수 종료
			}

			// 장바구니 추가 알림
			alert("장바구니에 상품이 추가되었습니다.");

			// 폼을 제출하지 않도록 preventDefault() 호출
			event.preventDefault(); // 폼 제출 방지

			// 추가 로직 (필요하면 추가)

			// 폼을 제출하는 방식으로 변경
			var form = document.getElementById("addToCartForm");
			form.submit();
		}

		function filterBooks() {
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
		}

		function submitOrderForm() {
			var form = document.getElementById("orderForm");
			form.submit();
		}
		
		window.addEventListener("load", function() {
    		document.getElementById("bookSearch").addEventListener("input", filterBooks);
		});