<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <% 
	request.setCharacterEncoding("utf-8");
	String item_name = request.getParameter("item_name");
	int item_price = Integer.parseInt(request.getParameter("item_price"));
	double item_rate = Double.parseDouble(request.getParameter("item_rate"));
	int item_no = Integer.parseInt(request.getParameter("item_no"));
	
	System.out.println("item_no : " + item_no);
	System.out.println("item_name : " + item_name);
	System.out.println("item_price : " + item_price);
	System.out.println("item_rate : " + item_rate);  

//jdbc
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "com.mysql.jdbc.Driver";
 	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
 	String dbUser = "root";
 	String dbPw = "java0000";
 	
 	try{
 	 	Class.forName(driver);
 	 //02	
 	 	conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
 	 	conn.setAutoCommit(false);
 	 //03
 	 	String sql="UPDATE item SET item_name=?, item_price=?, item_rate=? WHERE item_no=?";
 	 	pstmt = conn.prepareStatement(sql);
 	 	
 	 	pstmt.setString(1, item_name);
 	 	pstmt.setInt(2, item_price);
 	 	pstmt.setDouble(3, item_rate);
 	 	pstmt.setInt(4, item_no);
 
 	 	//System.out.println(pstmt);
 	 //04 
 	 	pstmt.executeUpdate();
 	 	
 	 	conn.commit();
 	 }catch(Exception e){
 		 conn.rollback();
 		 e.printStackTrace();
 	 }finally{
 		 conn.close();
 		 pstmt.close();
 	 }
 	response.sendRedirect(request.getContextPath() + "/admin/item/itemList.jsp");

%>

</body>
</html>