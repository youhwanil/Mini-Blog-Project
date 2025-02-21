<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
    <title>글쓰기</title>
</head>
<body>
    <h2>새 글 작성</h2>
    <form method="post" action="write_process.jsp">
        제목: <input type="text" name="title" required><br>
        내용: <textarea name="content" required></textarea><br>
        <button type="submit">작성</button>
    </form>
</body>
</html>
