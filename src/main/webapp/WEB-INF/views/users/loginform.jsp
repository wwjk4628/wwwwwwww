<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Home: Login</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/users.css'/>">
</head>
<body>
    <form id="login-form" 
          name="loginform" 
          method="POST" 
          action="<c:url value='/users/login'/>">
        
        <label class="block-label" for="name">아이디</label> 
        <input id="name" name="name" type="text" value=""> 

        <label class="block-label" for="password">패스워드</label> 
        <input id="password" name="password" type="password" value="">

        <input type="submit" value="로그인">
    </form>
</body>
</html>
