package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.connection.DBCon;
import cn.techtutorial.dao.UserDao;
import cn.techtutorial.model.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.sendRedirect("login.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
//			out.println("This is Login servlet");
			String email= request.getParameter("login-email");
			String password= request.getParameter("login-password");
			
			try {
				UserDao udao= new UserDao(DBCon.getConnection());
				User user =udao.userLogin(email, password);
				
				if(user!=null) {
					//out.println("user login");
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("index.jsp");
				}else {
					out.println("user login failed");
				}
				
			} catch (ClassNotFoundException | SQLException e) {

				e.printStackTrace();
			}
			
			out.println(email+password);
			
		} 
	}

}
