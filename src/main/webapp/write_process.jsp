<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 세션에서 로그인한 사용자 아이디 가져오기
    String author = (String) session.getAttribute("userid");
    
    // 로그인한 사용자만 글 작성 가능하도록 설정
    if (author == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
        return;
    }

    // 사용자가 입력한 데이터 가져오기
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // DB 연결 정보
    String url = "jdbc:mysql://localhost:3309/blog?serverTimezone=UTC";
    String dbUser = "root";  // 본인의 DB 사용자명으로 변경
    String dbPassword = "rootpassword";  // 본인의 DB 비밀번호로 변경

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, dbUser, dbPassword);
        
        // SQL 쿼리 실행 (게시글 저장)
        String sql = "INSERT INTO posts (title, content, author) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setString(3, author);
        
        int result = pstmt.executeUpdate();  // 실행

        if (result > 0) {
            out.println("<script>alert('글이 성공적으로 작성되었습니다.'); location.href='index.jsp';</script>");
        } else {
            out.println("<script>alert('글 작성에 실패했습니다.'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다: " + e.getMessage() + "'); history.back();</script>");
    } finally {
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
