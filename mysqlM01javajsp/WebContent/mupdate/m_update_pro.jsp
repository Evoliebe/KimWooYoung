<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB"%>
<%-- <%@ page import="kr.or.ksmart.dto.Member"%> --%>

<%request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/>
<jsp:setProperty name="m" property="*"/>

<%
Connection conn = null;
PreparedStatement pstmt = null;

try{
//02단계 :DB연결(Connection)시작
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();

	pstmt = conn.prepareStatement(
			"UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
	/* System.out.println(pstmt + "<-- pstmt 1");
	System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1"); */

	pstmt.setString(1, m.getM_email());
	pstmt.setString(2, m.getM_pw());
	pstmt.setString(3, m.getM_level());
	pstmt.setString(4, m.getM_name());
	pstmt.setString(5, m.getM_id());
	
	//System.out.println(pstmt + "<-- pstmt 2");
	
	pstmt.executeUpdate();

	response.sendRedirect(request.getContextPath()+"/user/user_list.jsp");
	
}finally{
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>