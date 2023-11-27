package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.model.Cart;


@WebServlet("/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		
		
		try(PrintWriter out =response.getWriter();) {
			String action=request.getParameter("action");
			int id=Integer.parseInt(request.getParameter("id"));
			
			ArrayList<Cart> cart_list =(ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			
			if(action !=null && id>=1) {
				
				
			}
			
				
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}

}
