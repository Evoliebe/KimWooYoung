<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.or.ksmart.driverdb.DriverDB"%>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<%	
	Connection conn =null;
	
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");

%>