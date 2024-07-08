<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
    
    <!-- 로그인 페이지:회원 이름과 비밀번호, 코드(1~7)를 확인 후 1일 경우, admin_home.html로 이동, 나머지는 branch_home.html로 이동-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <script>
        function validateLogin() {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const code = parseInt(document.getElementById('code').value, 10);

            if (username && password && !isNaN(code) && code >= 1 && code <= 7) {
                if (code === 1) {
                    window.location.href = '../../admins/admin_home.html';
                } else {
                    window.location.href = '../../branches/branch_home.html';

                }
            } else {
                alert('Please enter a valid username, password, and a code between 1 and 7.');
            }
        }
    </script>
</head>
<body>
    <h2>Login</h2>
    <form onsubmit="event.preventDefault(); validateLogin();">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <label for="code">Code (1-7):</label>
        <input type="number" id="code" name="code" min="1" max="7" required><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>