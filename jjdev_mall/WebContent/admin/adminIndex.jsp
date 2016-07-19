<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#adminLoginId').focus();
		$('#adminLoginBtn').click(function(){
			if($('#adminLoginId').val()==""){
				alert("ID를 입력하세요.");
				$('#adminLoginId').focus();
			}else if($('#adminLoginPw').val()==""){
				alert("PW를 입력하세요.");
				$('#adminLoginPw').focus();
			}else{
				$('#adminLoginForm').submit();
			}
		});
	});
</script>
</head>
<body>
<h1>Admin Login</h1>
<%
	String sessionAdminId = (String)session.getAttribute("sessionAdminId");
	if(sessionAdminId == null) { // 로그인이 안된 상태
%>
		<form id="adminLoginForm" action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp" method="post">
			<table>
				<tr>
					<td>ID : </td>
					<td><input type = "text" id="adminLoginId" name="adminLoginId"></td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input type = "password" id="adminLoginPw" name="adminLoginPw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type = "button" id="adminLoginBtn" value="Login"></td>
				</tr>
			</table>
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<ol>
			<li><a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">로그아웃</a>
			<li><a href="<%=request.getContextPath()%>/admin/item/itemList.jsp">상품관리</a></li>
			<li><a href="">주문관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/member/memberListAll.jsp">회원관리</a></li>
		</ol>
<%		
	}
%>
</body>
</html>