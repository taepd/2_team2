<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tomcat Connection Pool</title>
</head>
<body>
<%
	Connection conn = null;

	Context context = new InitialContext(); //현재 프로젝트에 이름기반 검색
	DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");//java:comp/env/ + name

	//POOL안에서 connection 가지고 오기
	conn = ds.getConnection();
	
	out.print("db 연결여부 : " + conn.isClosed() + "<br>");
	
	//POINT
	//POOL에 connection 받환하기
	conn.close(); //반환하기
	
	out.print("db 연결여부 : " + conn.isClosed() + "<br>");
	
%>
</body>
</html>








