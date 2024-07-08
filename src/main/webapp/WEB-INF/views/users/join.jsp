<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- íìê°ì íì´ì§: ì¬ì©ì ì´ë¦ê³¼ ë¹ë°ë²í¸, ì½ëë¥¼ ìë ¥ë°ìµëë¤. ì±ê³µíë©´ íìê°ìì ì±ê³µíë¤ë ìëê³¼ í¨ê» ë¡ê·¸ì¸ íì´ì§(login.html)ë¡ ì´ëí©ëë¤.-->
    <h1>íìê°ì íì´ì§</h1>
    <form id="signupForm" action="login.html" method="post">
        <label for="username">ì¬ì©ì ì´ë¦:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">ë¹ë°ë²í¸:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label for="code">ì½ë:</label>
        <input type="text" id="code" name="code" required><br><br>
        
        <button type="submit">íìê°ì</button>
    </form>

    <script>
        document.getElementById('signupForm').addEventListener('submit', function(event) {
            event.preventDefault();
            alert('íìê°ìì ì±ê³µíìµëë¤! ë¡ê·¸ì¸ íì´ì§ë¡ ì´ëí©ëë¤.');
            window.location.href = 'login.html';
        });
    </script>
</body>
</html>