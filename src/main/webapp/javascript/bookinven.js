document.addEventListener("DOMContentLoaded", function() {
    // 초기 orderBy 값을 숨겨진 필드에서 읽어옵니다.
    let orderByField = document.getElementById('orderBy');

    window.updateOrderBy = function(field) {
        let currentOrderBy = orderByField.value;

        if (currentOrderBy === field + ' asc') {
            currentOrderBy = field + ' desc';
        } else if (currentOrderBy === field + ' desc') {
            currentOrderBy = '';
        } else {
            currentOrderBy = field + ' asc';
        }

        orderByField.value = currentOrderBy;
        document.getElementById('search-form').submit();
    }
});