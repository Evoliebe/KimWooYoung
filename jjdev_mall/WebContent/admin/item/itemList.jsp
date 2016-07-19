<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table, td {
		border : 1px solid #000000;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<td>item_No</td><td>이름</td><td>가격</td><td>할인율</td><td>수정</td><td>추가</td><td>삭제</td>
</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String driver = "com.mysql.jdbc.Driver";
 	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
 	String dbUser = "root";
 	String dbPw = "java0000";
 	
 //jdbc
 	 	try{
 	 	Class.forName(driver);
 	 //02	
 	 	conn = DriverManager.getConnection(dbUrl, dbUser, dbPw);
 	 	conn.setAutoCommit(false);
 	 //03
 	 	String sql="select * from item";
 	 	pstmt = conn.prepareStatement(sql);
 	 	 
 	 	//System.out.println(pstmt);
 	 //04 
 	 	rs = pstmt.executeQuery();
 	 	while(rs.next()){%>
 	 		<tr>
 	 		<td><%=rs.getInt("item_no")%></td>
 	 		<td><%=rs.getString("item_name")%></td>
 	 		<td><%=rs.getInt("item_price")%></td>
 	 		<td><%=rs.getDouble("item_rate")%></td> 
 	 		<td><a href="<%=request.getContextPath()%>/admin/item/itemAddForm.jsp">추가</a></td>
 	 		<td><a href="<%=request.getContextPath()%>/admin/item/itemUpdateForm.jsp?sendItemName=<%=rs.getString("item_name")%>">수정</a></td>
 	 		<td><a href="<%=request.getContextPath()%>/admin/item/itemDeleteAction.jsp">삭제</a></td>	
 	 	<% }
 	 	conn.commit();
 	 }catch(Exception e){
 		 conn.rollback();
 		 e.printStackTrace();
 	 }finally{
 		 conn.close();
 		 pstmt.close();
 		 rs.close();
 	 }
 	
 	
%>
</table>
</body>
</html>