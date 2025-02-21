<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form method="post" action="register_process.jsp">
        아이디: <input type="text" name="userid" required><br>
        비밀번호: <input type="password" name="password" required><br>
        <button type="submit">가입</button>
    </form>
</body>
</html>