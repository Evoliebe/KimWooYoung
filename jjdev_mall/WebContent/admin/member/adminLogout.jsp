<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate(); //세션종료

response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
%>

</body>
</html>