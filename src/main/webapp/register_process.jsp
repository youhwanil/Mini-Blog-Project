<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/blog", "root", "1234");
        String sql = "INSERT INTO users (userid, password) VALUES (?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userid);
        pstmt.setString(2, password);
        pstmt.executeUpdate();
        response.sendRedirect("login.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
