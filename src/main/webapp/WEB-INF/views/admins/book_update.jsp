<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본사 관리 시스템</title>
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
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
        }
        .approve {
            background-color: #4CAF50;
            color: white;
        }
        .reject {
            background-color: #f44336;
            color: white;
        }
        .add {
            background-color: #008CBA;
            color: white;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/admin_includes/navigation.jsp" %>

    <div class="content">
       

        <h1>교재 리스트 관리</h1>
        <button class="add">새 교재 추가</button>
        <table>
            <tr>
                <th>교재 ID</th>
                <th>교재명</th>
                <th>저자</th>
                <th>출판사</th>
                <th>가격</th>
                <th>작업</th>
            </tr>
            <tr>
                <td>BOOK001</td>
                <td>국어 기본서</td>
                <td>김국어</td>
                <td>한국출판사</td>
                <td>25,000원</td>
                <td>
                    <button>수정</button>
                    <button class="reject">삭제</button>
                </td>
            </tr>
            <tr>
                <td>BOOK002</td>
                <td>수학 문제집</td>
                <td>이수학</td>
                <td>수학나라</td>
                <td>30,000원</td>
                <td>
                    <button>수정</button>
                    <button class="reject">삭제</button>
                </td>
            </tr>
            <tr>
                <td>BOOK003</td>
                <td>영어 단어장</td>
                <td>박영어</td>
                <td>글로벌북스</td>
                <td>18,000원</td>
                <td>
                    <button>수정</button>
                    <button class="reject">삭제</button>
                </td>
            </tr>
            <tr>
                <td>BOOK004</td>
                <td>과학 실험서</td>
                <td>최과학</td>
                <td>과학세계</td>
                <td>28,000원</td>
                <td>
                    <button>수정</button>
                    <button class="reject">삭제</button>
                </td>
            </tr>
            <tr>
                <td>BOOK005</td>
                <td>사회 참고서</td>
                <td>정사회</td>
                <td>사회문화사</td>
                <td>22,000원</td>
                <td>
                    <button>수정</button>
                    <button class="reject">삭제</button>
                </td>
            </tr>
            <tr>
                <td>BOOK006</td>
                <td>한국사 정리노트</td>
                <td>한역사</td>
                <td>역사연구소</td>
                <td>20,000원</td>
                <td>
                    <button>수정</button>
                    <button class="reject">삭제</button>
                </td>
            </tr>
            <tr>
                <td>BOOK007</td>
                <td>세계사 개론</td>
                <td>세계사</td>
                <td>글로벌역사출판</td>
                <td>32,000원</td>
                <td>
                    <button>수정</button>
                    <button class="reject">삭제</button>
                </td>
            </tr>
        </table>

       
    </div>
</body>
</html>