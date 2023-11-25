<%@page import="cn.techtutorial.model.User"%>
<%@page import="cn.techtutorial.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	User auth =(User)request.getSession().getAttribute("auth");
	if(auth!=null){
		request.setAttribute("auth", auth);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Cart pages</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>


<%@include file="includes/footer.jsp" %>
</body>
</html>