document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('search-form');

    // 폼 제출 시 AJAX 요청을 보냅니다.
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // 폼의 기본 제출 동작을 방지합니다.
        const keyword = document.querySelector('input[name="keyword"]').value;

        fetch('http://localhost:8080/Inventory/branch/stockout/search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'keyword': keyword
            })
        })
        .then(response => response.json())
        .then(data => {
            updateSearchResults(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

    // 검색 결과를 페이지에 업데이트합니다.
    function updateSearchResults(data) {
        const tableBody = document.getElementById('table-body');
        tableBody.innerHTML = ''; // 기존 결과를 지웁니다.

        // 데이터를 기반으로 결과를 생성합니다.
        data.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${item.bookName}</td>
                <td>${item.inventory}</td>
                <td>
                    <input type="hidden" name="bookCode" value="${item.bookCode}">
                    <input type="hidden" name="bookName" value="${item.bookName}">
                    <input type="number" name="quantity" min="0" max="${item.inventory}"
                        data-book-code="${item.bookCode}"
                        data-book-name="${item.bookName}"
                        oninput="validateAndHandleQuantity(this, ${item.inventory})">
                </td>
                <td>
                    <textarea class="comment-box" data-book-code="${item.bookCode}" placeholder="코멘트를 입력하세요"></textarea>
                </td>
            `;
            tableBody.appendChild(row);
        });
    }

    // 검색어 초기화
    window.resetKeyword = function() {
        document.querySelector('input[name="keyword"]').value = '';
        form.dispatchEvent(new Event('submit')); // 폼 제출 이벤트를 강제로 발생시킵니다.
    }
});


// 모달 닫기 함수
function closeModal() {
    const modal = document.getElementById('confirmationModal');
    modal.style.display = 'none';
}

// 모달 바깥을 클릭하면 닫히는 기능을 추가합니다.
document.addEventListener('click', function(event) {
    const modal = document.getElementById('confirmationModal');
    if (modal.style.display === 'block' && event.target === modal) {
        closeModal();
    }
});

// 수량 입력 최대값은 보유 수량을 넘지 않는 함수
function validateQuantity(input, max) {
    const value = parseInt(input.value, 10) || 0; // 값을 숫자로 변환하고 NaN을 0으로 처리
    if (value < 0) {
        input.value = 0;
    } else if (value > max) {
        input.value = max;
    }
}

// 수량 변경 시 처리 함수
function handleQuantityChange(input) {
    const bookCode = input.dataset.bookCode;
    const bookName = input.dataset.bookName; // 책 이름 가져오기
    const textarea = document.querySelector(`textarea[data-book-code="${bookCode}"]`);

    if (!textarea) return; // textarea가 존재하지 않을 경우 처리

    const quantity = parseInt(input.value, 10) || 0; // 값을 숫자로 변환하고 NaN을 0으로 처리

    // 입력 값이 0보다 크면 textarea를 활성화, 그렇지 않으면 비활성화
    if (quantity > 0) {
        textarea.disabled = false;
    } else {
        textarea.disabled = true;
        textarea.value = ''; // 수량이 0일 때 댓글 내용을 지웁니다.
        const comments = JSON.parse(localStorage.getItem('comments') || '{}');
        delete comments[bookCode];
        localStorage.setItem('comments', JSON.stringify(comments));
    }

    // 수량과 책 이름을 LocalStorage에 저장합니다.
    const quantities = JSON.parse(localStorage.getItem('quantities') || '{}');
    const bookNames = JSON.parse(localStorage.getItem('bookNames') || '{}');
    quantities[bookCode] = quantity;
    bookNames[bookCode] = bookName; // 책 이름도 저장합니다.
    localStorage.setItem('quantities', JSON.stringify(quantities));
    localStorage.setItem('bookNames', JSON.stringify(bookNames));
}

// 수량 유효성 검사 및 처리 함수
function validateAndHandleQuantity(input, max) {
    validateQuantity(input, max); // 수량 유효성 검사
    handleQuantityChange(input);  // textarea 활성화/비활성화 처리
}

// 모달 확인 함수
function showConfirmationModal() {
    const modal = document.getElementById('confirmationModal');
    const modalBody = document.getElementById('modal-body');
    modalBody.innerHTML = ''; // 기존 내용을 지웁니다.

    // LocalStorage에서 수량과 코멘트를 불러옵니다.
    const quantities = JSON.parse(localStorage.getItem('quantities') || '{}');
    const comments = JSON.parse(localStorage.getItem('comments') || '{}');
    const bookNames = JSON.parse(localStorage.getItem('bookNames') || '{}');

    // LocalStorage의 모든 항목을 모달에 추가합니다.
    Object.keys(quantities).forEach(bookCode => {
        const quantity = quantities[bookCode];
        const comment = comments[bookCode] || '';
        const bookName = bookNames[bookCode] || '정보 없음';
        
        // 수량이 0보다 큰 경우만 모달에 추가합니다.
        if (quantity > 0) {
            const div = document.createElement('div');
            div.innerHTML = `
                <p><strong>교재명:</strong> ${bookName}</p>
                <p><strong>수량:</strong> ${quantity}</p>
                <p><strong>코멘트:</strong> ${comment}</p>
                <hr>
            `;
            modalBody.appendChild(div);
        }
    });

    // 모달을 보여줍니다.
    modal.style.display = 'block';
}

// DOMContentLoaded 이벤트 리스너
document.addEventListener('DOMContentLoaded', function() {
    // 모든 textarea를 비활성화 상태로 설정
    document.querySelectorAll('textarea.comment-box').forEach(textarea => {
        textarea.disabled = true;
    });

    // LocalStorage에서 수량과 댓글을 불러오기
    const quantities = JSON.parse(localStorage.getItem('quantities') || '{}');
    const comments = JSON.parse(localStorage.getItem('comments') || '{}');

    // 수량 입력 필드 초기화
    const quantityInputs = document.querySelectorAll('input[name="quantity"]');
    quantityInputs.forEach(input => {
        const bookCode = input.dataset.bookCode;
        if (quantities[bookCode] !== undefined) {
            input.value = quantities[bookCode];
            validateAndHandleQuantity(input, input.max); // 초기화 시 유효성 검사 및 처리
        }
    });

    // comments 입력 필드 초기화
    const commentBoxes = document.querySelectorAll('textarea.comment-box');
    commentBoxes.forEach(textarea => {
        const bookCode = textarea.dataset.bookCode;
        if (comments[bookCode] !== undefined) {
            textarea.value = comments[bookCode];
        }
        textarea.addEventListener('input', function() {
            comments[bookCode] = textarea.value;
            localStorage.setItem('comments', JSON.stringify(comments));
        });
    });

});

// 검색 폼 제출 시 LocalStorage에 저장
document.getElementById('search-form').addEventListener('submit', function() {
    const quantities = {};
    const comments = {};
    const quantityInputs = document.querySelectorAll('input[name="quantity"]');
    quantityInputs.forEach(input => {
        const bookCode = input.dataset.bookCode;
        quantities[bookCode] = input.value;
    });
    const commentBoxes = document.querySelectorAll('textarea.comment-box');
    commentBoxes.forEach(textarea => {
        const bookCode = textarea.dataset.bookCode;
        comments[bookCode] = textarea.value;
    });
    localStorage.setItem('quantities', JSON.stringify(quantities));
    localStorage.setItem('comments', JSON.stringify(comments));
});

// 주문 폼 제출 함수
function submitOrderForm() {
    const form = document.getElementById('orderForm');

    let orderData = [];

    const quantityInputs = document.querySelectorAll('input[name="quantity"]');
    quantityInputs.forEach(input => {
        const bookCode = input.dataset.bookCode;
        const quantity = input.value;
        const commentTextarea = document.querySelector(`textarea[data-book-code="${bookCode}"]`);
        const comments = commentTextarea ? commentTextarea.value : '';
        
        if (quantity > 0 || comments) { // 수량이 0보다 크거나 코멘트가 있는 경우만 전송
            orderData.push({
                bookCode: bookCode,
                quantity: quantity,
                comments: comments
            });
        }
    });

    // 데이터를 JSON으로 변환
    const jsonData = JSON.stringify(orderData);

    // 데이터를 서버에 전송
    fetch('http://localhost:8080/Inventory/branch/stockout/confirm', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: jsonData
    }).then(response => {
        if (response.ok) {
            localStorage.clear();
            window.location.href = 'http://localhost:8080/Inventory/branch/stockout/list'; // 성공 후 리디렉션
        } else {
            alert('문제가 발생했습니다. 다시 시도해 주세요.');
        }
    }).catch(error => {
        console.error('Error:', error);
    });
}
