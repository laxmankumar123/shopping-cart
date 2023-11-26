<%@page import="cn.techtutorial.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.User"%>
<%@page import="cn.techtutorial.connection.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ProductDao pd = new ProductDao(DBCon.getConnection());
List<Product> products = pd.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to shopping cart</title>
<%@include file="includes/head.jsp"%>
</head>
<body>

	<%@include file="includes/navbar.jsp"%>

	<div class="container">

		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">

				<div class="card w-100" style="width: 18rem;">
					<img class="card-img-top" src="product-image/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">C<%=p.getName() %></h5>
						<h6 class="price">Price:<%=p.getPrice() %>></h6>
						<h6 class="category">Category:<%=p.getCategory() %>></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="#"
								class="btn btn-primary">Buy Now</a>

						</div>

					</div>
				</div>

			</div>

			<%
			}
			}
			%>



		</div>

	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>