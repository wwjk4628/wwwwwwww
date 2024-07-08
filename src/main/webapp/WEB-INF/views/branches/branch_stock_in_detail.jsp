<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지점 관리 시스템</title>
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
            <li><a href="/branches/branch_home.html">교재 재고</a></li>
            <li><a href="/branches/branch_order_list.html">발주</a></li>
            <li><a href="/branches/branch_stock_in_list.html">입고</a></li>
            <li><a href="/branches/branch_stock_out_list.html">출고</a></li>
            <li style="color: red;">본사페이지</li>
            <li><a href="/order-approval.html">발주 승인</a></li>
            <li><a href="/book-management.html">교재 관리</a></li>
            <li><a href="/member-approval.html">회원 승인</a></li>
        </ul>
    </nav>
    <div class="content">
       
        
        <h2>입고 기록</h2>
        <h3><a href="/branches/branch_stock_in_list.html">입고</a></h3>
        <table>
            <tr>
                <th>입고 번호</th>
                <th>발주 번호</th>
                <th>날짜</th>
                <th>상태</th>
            </tr>
            <tr>
                <td>IN001</td>
                <td>ORD002</td>
                <td>2024-07-04</td>
                <td>완료</td>
            </tr>
            <tr>
                <td>IN002</td>
                <td>ORD003</td>
                <td>2024-07-03</td>
                <td>완료</td>
            </tr>
        </table>

    </div>
</body>