<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
	table, td {
		border : 1px solid ;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sendItemName = request.getParameter("sendItemName");
System.out.println("sendItemName : " + sendItemName);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

String dbItemNo = null;
String dbItemName = null;
String dbItemPrice = null;
String dbItemRate = null;

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
	String sql="select * from item where item_name=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sendItemName);
	 
	//System.out.println(pstmt);
//04 
	rs = pstmt.executeQuery();

	if(rs.next()){
		dbid = rs.getString("m_id");
		dbpw = rs.getString("m_pw");
		dblevel = rs.getString("m_level");
		dbname = rs.getString("m_name");
		dbemail = rs.getString("m_email");
		//콘솔창에 출력한다
	}


%>









<form id="updateForm" action="<%=request.getContextPath() %>/admin/item/itemUpdateAction.jsp" method="post">
<h1>Item Update</h1>
<table>
	<tr>
		<td>이름 : </td>
		<td>
			<input type="text" id="item_name" name="item_name">
		</td>
	</tr>
	<tr>
		<td>가격 : </td>
		<td>
			<input type="text" id="item_price" name="item_price">
		</td>
	</tr>
	<tr>
		<td>할인율 : </td>
		<td>
			<input type="text" id="item_rate" name="item_rate">
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" id="addBtn" value="아이템 추가"></td>
	</tr>	
</table>
</form>

</body>
</html>