<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/blog", "root", "1234");
        String sql = "SELECT * FROM users WHERE userid = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userid);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            session.setAttribute("userId", userid);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
