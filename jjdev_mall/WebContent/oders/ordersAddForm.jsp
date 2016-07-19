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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>

</script>
<title>Insert title here</title>
</head>
<body>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	
	int sendItemPrice = Integer.parseInt(request.getParameter("sendItemPrice"));
	double sendItemRate = Double.parseDouble(request.getParameter("sendItemRate"));
	
	System.out.println("sendItemPrice : "+sendItemPrice);
	System.out.println("sendItemRate : "+sendItemRate);
	
	if(sessionMemberId == null) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	} else {
		//주문 폼 구현
		
		// select JDBC 코드
		
		request.setCharacterEncoding("utf-8");
	 	Connection conn = null;
	 	PreparedStatement pstmt = null;
	 	ResultSet rs = null;
	 	String sql = null;
	 	
	 	String driver = "com.mysql.jdbc.Driver";
	 	String dbUrl = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf8";
	 	String dbUser = "root";
	 	String dbPw = "java0000";
	
%>
	<h1>Order</h1>
	<form id="ordersForm" action="<%= request.getContextPath() %>/orders/ordersAddAction.jsp">
		<table>
			<tr>
				<td>상품 번호 : </td>
				<td></td>
			</tr>
						<tr>
				<td>상품 번호 : </td>
				<td></td>
			</tr>
						<tr>
				<td>상품 번호 : </td>
				<td></td>
			</tr>
		</table>
	</form>


<%} %>
</body>
</html>
<%-- 			itemNo 
			<input type="text" value="itemNo" readonly="readonly"/>
		</div>
		<div>
			itemPrice
			<input type="text" value="itemPrice"/>
			<span><%=itemPrice*(1-itemRate) %></span>
			<span>(할인율:<%=itemRate %>)</span>
		</div>
		<div>
			ordersQuantity
			<input type="text" value="ordersQuantity"/>
			<select>
				<option value="">:::선택:::</option>
			</select>
		</div>
		<div>
			total : <span></span>
		</div>
		
		<div>
			<input type="button" id="ordersBtn" value="주문"/>
		</div>
 --%>