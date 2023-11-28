package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DBCon;
import cn.techtutorial.dao.Order;
import cn.techtutorial.dao.OrderDao;
import cn.techtutorial.model.Cart;
import cn.techtutorial.model.User;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out =response.getWriter()) {
			
			SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
			Date date=new Date();
			// user authentication
			User auth=	(User) request.getSession().getAttribute("auth");
			//retrive all cart product
			ArrayList<Cart> cart_list=(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			// check auth and cart list
			if(cart_list !=null && auth !=null) {
				
				for(Cart c:cart_list) {
					// preapre for object 
					Order order= new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					//instantiate the dao class
					OrderDao oDao= new OrderDao(DBCon.getConnection());
					//// calling insert methopd
					boolean result = oDao.insertOrder(order);
					
					if(! result) break;
				}
				
				cart_list.clear();
				response.sendRedirect("orders.jsp");
				
				
				
			}else {
				if(auth ==null) {
					response.sendRedirect("login.jsp");
				}else {
					response.sendRedirect("cart.jsp");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
