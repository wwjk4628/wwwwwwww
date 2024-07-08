<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- 회원가입 페이지: 사용자 이름과 비밀번호, 코드를 입력받습니다. 성공하면 회원가입에 성공했다는 알람과 함께 로그인 페이지(login.html)로 이동합니다.-->
    <h1>회원가입 페이지</h1>
    <form id="signupForm" action="login.html" method="post">
        <label for="username">사용자 이름:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="code">코드:</label>
        <input type="text" id="code" name="code" required><br><br>
        
        <button type="submit">회원가입</button>
    </form>

    <script>
        document.getElementById('signupForm').addEventListener('submit', function(event) {
            event.preventDefault();
            alert('회원가입에 성공했습니다! 로그인 페이지로 이동합니다.');
            window.location.href = 'login.html';
        });
    </script>
</body>
</html>