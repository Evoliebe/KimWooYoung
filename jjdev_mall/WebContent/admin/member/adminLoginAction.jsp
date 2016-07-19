<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String adminLoginId = request.getParameter("adminLoginId");
	String adminLoginPw = request.getParameter("adminLoginPw");
	
/* 	System.out.println("loginId : " + loginId);
	System.out.println("loginPw : " + loginPw); */

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	String driver = "com.mysql.jdbc.Driver";
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
	String dbUser = "root";
	String dbPass = "java0000";

//jdbc	
	
	try{
		Class.forName(driver);
 	 	
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
 	 	
 	 	conn.setAutoCommit(false);
 	 	
	 	sql="select * from admin where admin_id=?";
 	 	pstmt = conn.prepareStatement(sql);
 	 	
 	 	pstmt.setString(1, adminLoginId);
 	 	
 	 	rs = pstmt.executeQuery();
 	 	String dbId = null;
 	 	String dbPw = null;
 	 	
 	 	
		if(rs.next()) {
			System.out.println("아이디 일치");
			dbId = rs.getString("admin_id");
			dbPw = rs.getString("admin_pw");
			if(adminLoginPw.equals(dbPw)){
				System.out.println("로그인 성공");
				// 세션에 아이디값 저장
				session.setAttribute("sessionAdminId", dbId);
				session.setAttribute("sessionAdminPw", dbPw);

			}else{
				System.out.println("비밀번호 불일치");
			}
		} else {
			System.out.println("아이디 불일치");
		}		
	} catch (Exception e) {

	} finally {
		
	}
	// 로그인 성공,실패에 상관없이 index.jsp로 이동
	response.sendRedirect(request.getContextPath() + "/admin/adminIndex.jsp");
%>
</body>
</html>