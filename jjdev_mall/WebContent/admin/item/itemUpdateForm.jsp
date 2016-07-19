<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
table, td {
	border: 1px solid;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('#item_name').focus();
				$('#updateBtn').click(
						function() {
							if ($('#item_name').val() == "") {
								alert("아이템 이름을 입력해주세요.");
								$('#item_name').focus();
							} else if ($('#item_price').val() == ""
									|| isNaN($('#item_price').val())) {
								alert("가격을 옳바르게 입력해주세요.")
								$('#item_price').focus();
							} else if ($('#item_rate').val() == ""
									|| $('#item_rate').val() > 1
									|| isNaN($('#item_rate').val())) {
								alert("옳바른 할인율을 입력해주세요.")
								$('#item_rate').focus();
							} else {
								$('#updateForm').submit();
							}
						});
			});
</script>
</head>
<body>
	<%
		String sendItemName = request.getParameter("sendItemName");
		//System.out.println("sendItemName : " + sendItemName);

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		int dbItemNo = 0;
		String dbItemName = null;
		int dbItemPrice = 0;
		double dbItemRate = 0;

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
			sql = "select * from item where item_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sendItemName);

			//System.out.println(pstmt);
			//04 
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("item_name").equals(sendItemName)) {
					dbItemNo = rs.getInt("item_no");
					dbItemName = rs.getString("item_name");
					dbItemPrice = rs.getInt("item_price");
					dbItemRate = rs.getDouble("item_rate");
				}
/* 				System.out.println("dbItemNo : " + dbItemNo);
				System.out.println("dbItemName : " + dbItemName);
				System.out.println("dbItemPrice : " + dbItemPrice);
				System.out.println("dbItemRate : " + dbItemRate); */
			}
	%>
	<form id="updateForm" action="<%=request.getContextPath()%>/admin/item/itemUpdateAction.jsp?sendItemNo=<%=dbItemNo %>" method="post">
		<h1>Item Update</h1>
		<table>
			<tr>
				<td>No : </td>
				<td><input type="text" id="item_no" name="item_no" value="<%=dbItemNo%>"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><input type="text" id="item_name" name="item_name" value="<%=dbItemName%>"></td>
			</tr>
			<tr>
				<td>가격 :</td>
				<td><input type="text" id="item_price" name="item_price" value="<%=dbItemPrice%>"></td>
			</tr>
			<tr>
				<td>할인율 :</td>
				<td><input type="text" id="item_rate" name="item_rate" value="<%=dbItemRate%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="updateBtn" value="아이템 수정"></td>
			</tr>
		</table>
	</form>
	<%
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
	%>
</body>
</html>