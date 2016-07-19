<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String sendItemName = request.getParameter("sendItemName");
		//System.out.println("sendItemName : " + sendItemName);

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		String driver = "com.mysql.jdbc.Driver";
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPw = "java0000";

		//jdbc
		try {
			Class.forName(driver);

			//02	
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			conn.setAutoCommit(false);
			//03
			sql = "DELETE FROM item WHERE item_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sendItemName);

			//System.out.println(pstmt);
			//04 
			pstmt.executeUpdate();
			
			conn.commit();

		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
		response.sendRedirect(request.getContextPath() + "/admin/item/itemList.jsp");
	%>
</body>
</html>