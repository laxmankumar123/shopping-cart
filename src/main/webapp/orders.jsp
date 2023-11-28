<%@page import="cn.techtutorial.dao.OrderDao"%>
<%@page import="cn.techtutorial.dao.Order"%>
<%@page import="java.util.List"%>
<%@page import="cn.techtutorial.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.techtutorial.model.User"%>
<%@page import="cn.techtutorial.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	List<Order> orders=null;
	User auth =(User)request.getSession().getAttribute("auth");
	if(auth!=null){
		request.setAttribute("auth", auth);
		orders=new OrderDao(DBCon.getConnection()).userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");
	if(cart_list !=null){
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Order page</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
			<tr>
			 <th scope="col">Date</th>
			 <th scope="col">Name</th>
			 <th scope="col">Categ</th>
			 <th scope="col">Quaty</th>
			 <th scope="col">Price</th>
			 <th scope="col">Cancel</th>
			</tr>
			</thead>
			<tbody>
			
			<%
			
			if(orders !=null){
				for(Order o:orders){%>
				<tr>
				<td><%=o.getDate() %></td>
				<td><%=o.getName() %></td>
				<td><%=o.getCategory() %></td>
				<td><%=o.getQuantity() %></td>
				<td><%=o.getPrice() %></td>
				<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel</a></td>
					
				</tr>	
				<%}
			}

			%>
					
			</tbody>
		</table>
	
	</div>


<%@include file="includes/footer.jsp" %>
</body>
</html>