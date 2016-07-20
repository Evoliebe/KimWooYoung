<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kr.or.ksmart.dto.Member"%>
<!DOCTYPE html>

<%
	Member m = new Member();
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_level = request.getParameter("m_level");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");

/* 	m.setM_id(m_id);
	m.setM_pw(m_pw);
	m.setM_level(m_level);
	m.setM_name(m_name);
	m.setM_email(m_email); */
%>
<%-- <%=m.getM_id()%>
<%=m.getM_pw()%>
<%=m.getM_level()%>
<%=m.getM_name()%>
<%=m.getM_email()%> --%>