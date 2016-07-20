<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="kr.or.ksmart.driverdb.DriverDB"%>
<%-- <%@ page import="kr.or.ksmart.dto.Member"%>
 --%>
<% request.setCharacterEncoding("euc-kr");%>

<jsp:useBean id="m" class="kr.or.ksmart.dto.Member"/> <!-- => import 와 선언 생성 할당. id="m" 의 역할 객체참조변수로 주소값을 갖고있다.-->
<jsp:setProperty name="m" property="*"/>

<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	//JDBC 프로그램 순서

	try {
		//02단계 :DB연결(Connection)시작
		DriverDB db = new DriverDB();

		conn = db.driverDbcon();

		//System.out.println(conn + "<-- conn");
		//System.out.println(conn.getClass() + "<-- conn.getClass()");

		//03단계 :Query실행을 위한 statement 또는 prepareStatement객체생성 시작

		
		pstmt = conn.prepareStatement("INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		//System.out.println(pstmt + "<-- pstmt 1");
		//System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");

		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());

		//04단계 :Query실행 시작
		pstmt.executeUpdate();
		response.sendRedirect(request.getContextPath() + "/user/user_list.jsp");

		//05단계 :Query실행결과 사용 (insert의 경우 생략 가능단계)

	} finally {
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
			}
		//07단계 :Connection 객체 종료(close())
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException ex) {
			}
	}
%>