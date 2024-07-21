<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>AJAX Example</title>
    <!-- CSRF 토큰을 메타 태그로 설정 -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- CSS 파일 추가 -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/branches.css'/>">
</head>
<body>
    <%@ include file="/WEB-INF/views/branch_includes/navigation.jsp"%>
    <div id="head">
    </div>

    <!-- 장바구니 섹션 -->
    <div id="cart" class="cart">
        <h2>Cart</h2>
        <!-- 장바구니 아이템이 여기에 동적으로 추가됨 -->
        <div id="cartItems" class="cart-content"></div>
        <button id="clearCartBtn" class="delete">비우기</button>
        <!-- 발주 제출 폼 -->
        <form action="<c:url value="/branch/order/submit"/>" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" id="orderBtn" class="update">발주</button>
        </form>
        <button id="saveBtn" class="add">장바구니 추가</button>
    </div>

    <!-- 검색 입력 및 버튼 -->
    <input type="text" id="searchInput" placeholder="Search books...">
    <button id="searchBtn">Search</button>
    <!-- 검색 결과가 여기에 렌더링됨 -->
    <div id="result"></div>

    <!-- Spring Security CSRF Token -->
    <form:form method="post" action="#">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form:form>

    <script>
    $(document).ready(function() {
        var quantityMap = {}; // 수량 맵 초기화

        // CSRF 토큰 설정
        var csrfHeaderName = $('meta[name="_csrf_header"]').attr('content');
        var csrfToken = $('meta[name="_csrf"]').attr('content');
        
        // 서버에서 전달된 성공 여부 변수
        var success = '${success}';

        // 일정 시간 후 알림을 표시
        setTimeout(function() {
            if (success === 'true') {
                alert('Order has been placed successfully!');
            } else if (success === 'false') {
                alert('발주 실패!');
            }
        }, 100);

        // 모든 데이터를 로드하는 함수
        function loadAllData() {
            $.ajax({
                url: '/Inventory/branch/order/getData',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    quantityMap = {}; // 수량 맵 초기화
                    renderData(data); // 데이터를 렌더링
                    updateCart(); // 장바구니 업데이트
                    renderHeader(data);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                    $("#result").html("An error occurred while processing the request.");
                }
            });
        }

        // 통화 형식 변환기 설정
        var currencyFormatter = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' });
        
        function renderHeader(dataArray) {
            if (dataArray.length > 0) {
                var firstBranchId = dataArray[0].branchId;
                var result = '<h1>' + firstBranchId + '번 지점</h1>';
                $("#head").html(result);
            } else {
                $("#head").html('<h1>No Branch ID Available</h1>');
            }
        }
        
        
        // 데이터를 렌더링하는 함수
        function renderData(data) {
            var resultHtml = '<table>' +
                             '<thead>' +
                             '<tr>' +
                             '<th>교재명</th>' +
                             '<th>재고</th>' +
                             '<th>가격</th>' +
                             '<th>수량</th>' +
                             '</tr>' +
                             '</thead>' +
                             '<tbody>';

            data.forEach(function(book) {
                var selectedQuantity = quantityMap[book.bookCode] ? quantityMap[book.bookCode].quantity : 0;
                var formattedPrice = currencyFormatter.format(book.price); // 가격을 통화 형식으로 변환
                resultHtml += '<tr>' +
                              '<td>' + book.bookName + '</td>' +
                              '<td>' + book.inventory + '</td>' +
                              '<td>' + formattedPrice + '</td>' +
                              '<td>' +
                              '<input type="hidden" class="bookInvenInput" value="' + book.inventory + '">' +
                              '<input type="hidden" class="bookCodeInput" value="' + book.bookCode + '">' +
                              '<input type="hidden" class="bookNameInput" value="' + book.bookName + '">' +
                              '<input type="hidden" class="bookPriceInput" value="' + book.price + '">' +
                              '<input type="number" class="quantityInput" min="0" max="100000" value="' + selectedQuantity + '">' +
                              '</td>' +
                              '</tr>';
            });

            resultHtml += '</tbody></table>';
            $("#result").html(resultHtml);

            // 수량 입력이 변경될 때 이벤트 처리
            $(".quantityInput").on('input', function() {
                var $this = $(this); // 현재 이벤트가 발생한 객체
                var bookCode = $this.siblings('.bookCodeInput').val(); // 클래스가 bookCodeInput인 요소의 값
                var bookName = $this.siblings('.bookNameInput').val(); // 클래스가 bookNameInput인 요소의 값
                var bookPrice = $this.siblings('.bookPriceInput').val(); // 클래스가 bookPriceInput인 요소의 값
                var bookInven = $this.siblings('.bookInvenInput').val(); // 클래스가 bookInvenInput인 요소의 값
                var quantity = $this.val(); // 현재 이벤트가 발생한 객체의 값

                // 값이 범위를 벗어나지 않도록 처리
                var min = parseInt($this.attr('min'), 10);
                var max = parseInt($this.attr('max'), 10);

                // 숫자가 아닌 경우 처리
                if (isNaN(quantity) || quantity === '') {
                    quantity = min;
                } else {
                    quantity = Math.max(min, Math.min(max, parseInt(quantity, 10)));
                }

                $this.val(quantity); // 범위에 맞는 값으로 수정
                quantityMap[bookCode] = { bookCode: bookCode, bookName: bookName, price: bookPrice, inventory: bookInven, quantity: quantity };
                //updateCart(); // 장바구니 업데이트
            });
        }

        // 장바구니를 업데이트하는 함수
        function updateCart() {
            $.ajax({
                url: '/Inventory/branch/order/getCart',
                type: 'GET',
                dataType: 'json',
                success: function(cartData) {
                    var cartHtml = '<table>' +
                                   '<thead>' +
                                   '<tr>' +
                                   '<th>교재명</th>' +
                                   '<th>수량</th>' +
                                   '<th>예상 재고</th>' +
                                   '<th>가격</th>' +
                                   '<th>작업</th>' +
                                   '</tr>' +
                                   '</thead>' +
                                   '<tbody>';

                    var totalQuantity = 0; // 총 수량 초기화
                    var totalPrice = 0;    // 총 가격 초기화
                    var totalEstimatedInventory = 0; // 총 예상 재고 초기화

                    cartData.forEach(function(item) {
                        if (item.quantity > 0) {
                            var itemPrice = parseFloat(item.price);
                            var itemQuantity = parseInt(item.quantity, 10);
                            var itemTotalPrice = itemPrice * itemQuantity;
                            var itemEstimatedInventory = parseInt(item.inventory, 10) + itemQuantity; // 예상 재고 계산

                            totalQuantity += itemQuantity; // 총 수량에 추가
                            totalPrice += itemTotalPrice;   // 총 가격에 추가
                            totalEstimatedInventory += itemEstimatedInventory; // 총 예상 재고에 추가

                            cartHtml += '<tr>' +
                                        '<td>' + item.bookName + '</td>' +
                                        '<td>' + item.quantity + '</td>' +
                                        '<td>' + itemEstimatedInventory + '</td>' +
                                        '<td>' + currencyFormatter.format(itemTotalPrice) + '</td>' +
                                        '<td><button class="delete" data-book-code="' + item.bookCode + '">삭제</button></td>' +
                                        '</tr>';
                        }
                    });

                    // 총합을 표시하는 행 추가
                    cartHtml += '<tfoot>' +
                                '<tr>' +
                                '<td><strong>Total</strong></td>' +
                                '<td>' + totalQuantity + '</td>' +
                                '<td>' + totalEstimatedInventory + '</td>' +
                                '<td>' + currencyFormatter.format(totalPrice) + '</td>' +
                                '<td></td>' +
                                '</tr>' +
                                '</tfoot>';

                    cartHtml += '</tbody></table>';
                    $('#cartItems').html(cartHtml);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                    $('#cartItems').html('An error occurred while fetching the cart.');
                }
            });
        }

        // 삭제 버튼 클릭 이벤트 처리
        $(document).on('click', '.delete', function() {
            var bookCode = $(this).data('book-code'); // 버튼에 저장된 bookCode 가져오기
            deleteFromCart(bookCode); // 장바구니에서 삭제
        });

        // 장바구니에서 항목을 삭제하는 함수
        function deleteFromCart(bookCode) {
            $.ajax({
                url: '/Inventory/branch/order/deleteFromCart',
                type: 'POST',
                contentType: 'application/x-www-form-urlencoded',
                data: $.param({ bookCode: bookCode }),
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfToken);
                },
                success: function(response) {
                    loadAllData(); // 모든 데이터 재로드
                    setTimeout(function() {
                        if (response === "Item removed from cart.") {
                            alert("장바구니에서 아이템이 삭제되었습니다.");
                        }
                        updateCart(); // 장바구니 업데이트
                    }, 150);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                    alert("아이템 삭제 중 오류가 발생했습니다.");
                }
            });
        }

        // 장바구니 비우기 버튼 클릭 이벤트 처리
        $("#clearCartBtn").click(function() {
            $.ajax({
                url: '/Inventory/branch/order/clearCart',
                type: 'POST',
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfToken);
                },
                success: function(response) {
                    if (response === "Cart is already empty.") {
                        alert("장바구니가 비어있습니다.");
                    } else {
                        loadAllData(); // 모든 데이터 재로드
                        setTimeout(function() {
                            alert("장바구니가 비워졌습니다.");
                            updateCart(); // 장바구니 업데이트
                        }, 150);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                    alert("장바구니 비우기 중 오류가 발생했습니다.");
                }
            });
        });

        // 검색 버튼 클릭 이벤트 처리
        $("#searchBtn").click(function() {
            var query = $("#searchInput").val();
            $.ajax({
                url: '/Inventory/branch/order/searchBooks',
                type: 'GET',
                data: { query: query },
                dataType: 'json',
                success: function(data) {
                    renderData(data); // 검색 결과 렌더링
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                    $("#result").html("An error occurred while processing the request.");
                }
            });
        });

        // 장바구니 추가 버튼 클릭 이벤트 처리
        $("#saveBtn").click(function() {
            var bookQuantities = Object.keys(quantityMap).map(function(bookCode) {
                return {
                    bookCode: bookCode,
                    bookName: quantityMap[bookCode].bookName,
                    inventory: quantityMap[bookCode].inventory, // 재고 정보 추가
                    price: quantityMap[bookCode].price, // 가격 정보 추가
                    quantity: quantityMap[bookCode].quantity
                };
            });

            // 선택된 항목이 있는지 확인
            var allZero = bookQuantities.every(function(item) {
                return item.quantity === 0;
            });

            if (allZero) {
                alert("적어도 1개 이상은 선택해 주세요.");
                return; // 모든 항목이 0이면 처리 중지
            }

            $.ajax({
                url: '/Inventory/branch/order/saveQuantities',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(bookQuantities),
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfToken);
                },
                success: function(response) {
                    loadAllData(); // 데이터 저장 후 모든 데이터 재로드
                    setTimeout(function() {
                        alert("장바구니에 추가되었습니다!"); // 알림 표시
                    }, 150);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                    setTimeout(function() {
                        alert("An error occurred while saving quantities.");
                    }, 150);
                }
            });
        });

        // 발주 버튼 클릭 이벤트 처리
        $("#orderBtn").click(function(event) {
            event.preventDefault(); // 기본 폼 제출 방지

            // 장바구니에 항목이 있는지 확인하는 AJAX 요청
            $.ajax({
                url: '/Inventory/branch/order/getCart',
                type: 'GET',
                dataType: 'json',
                success: function(cartData) {
                    if (cartData.length > 0) {
                        // 장바구니에 항목이 있는 경우 확인 대화상자 표시
                        var confirmation = confirm("정말로 발주하시겠습니까?");
                        if (confirmation) {
                            // 확인을 누른 경우 폼을 제출
                            $("#orderBtn").closest('form').submit();
                        }
                    } else {
                        // 장바구니가 비어있는 경우 경고 메시지 표시
                        alert("장바구니에 항목이 없습니다. 발주를 진행할 수 없습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' - ' + error);
                    alert("장바구니를 확인하는 중 오류가 발생했습니다.");
                }
            });
        });

        loadAllData(); // 페이지 로드 시 모든 데이터 초기화
    });
    </script>
</body>
</html>
