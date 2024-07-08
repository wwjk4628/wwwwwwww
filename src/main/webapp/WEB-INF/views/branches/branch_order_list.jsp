<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ë°ì£¼ íì´ì§</title>
    <style>
        /* ì´ì  ì¤íì¼ ì ì§ */
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
    </style>
</head>
<body>
    <nav>
        <ul>
            <li><a href="/branches/branch_home.html">êµì¬ ì¬ê³ </a></li>
            <li><a href="/branches/branch_order_list.html">ë°ì£¼</a></li>
            <li><a href="/branches/branch_stock_in_list.html">ìê³ </a></li>
            <li><a href="/branches/branch_stock_out_list.html">ì¶ê³ </a></li>
            <li style="color: red;">ë³¸ì¬íì´ì§</li>
            <li><a href="/order-approval.html">ë°ì£¼ ì¹ì¸</a></li>
            <li><a href="/book-management.html">êµì¬ ê´ë¦¬</a></li>
            <li><a href="/member-approval.html">íì ì¹ì¸</a></li>
        </ul>
    </nav>

    <div class="content">
        <h1>ë°ì£¼ íì´ì§</h1>
        <h3><a href="/branches/branch_order_detail.html">ë°ì£¼ ê¸°ë¡</a></h3>
        <div class="order-form">
            <select>
                <option value="">êµì¬ ì í</option>
                <option value="book1">êµ­ì´ ê¸°ë³¸ì</option>
                <option value="book2">ìí ë¬¸ì ì§</option>
                <option value="book3">ìì´ ë¨ì´ì¥</option>
                <option value="book4">ê³¼í ì¤íì</option>
                <option value="book5">ì¬í ì°¸ê³ ì</option>
            </select>
            <input type="number" id="quantity" min="1" value="1">
            <button onclick="addToCart()">ì¥ë°êµ¬ëì ì¶ê°</button>
        </div>

        <div class="order-list">
            <table>
                <tr>
                    <th>êµì¬ëª</th>
                    <th>ìë</th>
                    <th>ìì</th>
                </tr>
                <tr><td>êµ­ì´ ê¸°ë³¸ì</td><td>10</td><td><button>ì­ì </button></td></tr>
                <tr><td>ìí ë¬¸ì ì§</td><td>5</td><td><button>ì­ì </button></td></tr>
                <tr><td>ìì´ ë¨ì´ì¥</td><td>15</td><td><button>ì­ì </button></td></tr>
            </table>
            <button onclick="submitOrder()">ë°ì£¼ ì ì¶</button>
        </div>

    </div>

    <script>
        function addToCart() {
            // ì¥ë°êµ¬ëì í­ëª©ì ì¶ê°íë ë¡ì§
        }

        function submitOrder() {
            // ë°ì£¼ë¥¼ ì ì¶íë ë¡ì§
        }
    </script>
</body>
</html>