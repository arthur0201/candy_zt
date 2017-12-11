package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.checkuser;
import DB.user;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/login")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginservlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strname = request.getParameter("username");
		String password = request.getParameter("password");
		user u = checkuser.check(strname,password);
		// String name=u.name;
		// if(u.name==null){} ��������ҳ��
		if ("".equals(u.name) || u.name ==null) {
			request.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} else {
			request.setAttribute("USERNAME", u.name);
			this.getServletContext().getRequestDispatcher("/suclogin.jsp").forward(request, response);
		}
//		request.setAttribute("USERNAME", u.name);
//		request.setAttribute("PASS", u.password);
//		this.getServletContext().getRequestDispatcher("/suclogin.jsp").forward(request, response);
	}

}
