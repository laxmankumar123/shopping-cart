<%@page import="cn.techtutorial.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to shopping cart</title>
<%@include file="includes/head.jsp"%>
</head>
<body>

		<%@include file="includes/navbar.jsp"%>
		
		<% out.println(DBCon.getConnection()); %>
		
		<%@include file="includes/footer.jsp"%>
</body>
</html>