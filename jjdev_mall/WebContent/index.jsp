<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#memberLoginId').focus();
		$('#memberLoginBtn').click(function(){
			if($('#memberLoginId').val()==""){
				alert("ID를 입력하세요.");
				$('#memberLoginId').focus();
			}else if($('#memberLoginPw').val()==""){
				alert("PW를 입력하세요.");
				$('#memberLoginPw').focus();
			}else{
				$('#memberLoginForm').submit();
			}
		});
	});
</script>
</head>
<body>
<h1>Member Login</h1>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	//System.out.println(sessionMemberId);
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form id="memberLoginForm" action="<%=request.getContextPath()%>/member/loginAction.jsp" method="post">
			<table>
				<tr>
					<td>ID : </td>
					<td><input type = "text" id="memberLoginId" name="memberLoginId"></td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input type = "password" id="memberLoginPw" name="memberLoginPw"></td>
				</tr>
				<tr>
					<td colspan="2"><input type = "button" id="memberLoginBtn" value="Login"></td>
				</tr>
			</table>
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<%=sessionMemberId%>님 반갑습니다.
		<a href="<%=request.getContextPath()%>/member/memberOne.jsp?sendId=<%=sessionMemberId %>">[회원정보]</a>
		<a href="<%=request.getContextPath()%>/member/itemList.jsp">[상품정보]</a>
		<a href="<%=request.getContextPath()%>/member/logout.jsp">[로그아웃]</a>
<%		
	}
%>
</body>
</html>