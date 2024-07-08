<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ì§ì  ê´ë¦¬ ìì¤í</title>
    <style>
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
            margin-bottom: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .form-group {
            margin-bottom: 15px;
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
        <h1>ì¶ê³ </h1>
        <div class="form-group">
            <select>
                <option value="">êµì¬ ì í</option>
                <option value="book1">êµ­ì´ ê¸°ë³¸ì</option>
                <option value="book2">ìí ë¬¸ì ì§</option>
                <option value="book3">ìì´ ë¨ì´ì¥</option>
                <option value="book4">ê³¼í ì¤íì</option>
                <option value="book5">ì¬í ì°¸ê³ ì</option>
            </select>
            <input type="number" placeholder="ìë" min="1" value="1">
            <button>ì¶ê³  ëª©ë¡ì ì¶ê°</button>
        </div>

       
        <button>ì¶ê³  íì¸</button>

        <h2>ì¶ê³  ê¸°ë¡</h2>
        <h3><a href="/branches/branch_stock_out_list.html">ì¶ê³  ê¸°ë¡</a></h3>
        
        <table>
            <tr>
                <th>ì¶ê³  ë²í¸</th>
                <th>ë ì§</th>
                <th>ìí</th>
            </tr>
            <tr>
                <td>OUT001</td>
                <td>2024-07-05</td>
                <td>ìë£</td>
            </tr>
            <tr>
                <td>OUT002</td>
                <td>2024-07-04</td>
                <td>ìë£</td>
            </tr>
        </table>
    </div>
</body>