package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnectionManager;
import DB.SelectManager;
import model.Candy;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 doPost(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			this.insert(request,response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insert(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException, ServletException {
		ConnectionManager connection = new ConnectionManager();
		Connection conn = null;
		PreparedStatement stat = null;
		SelectManager select = new SelectManager();
		String id = request.getParameter("id");
		String candyName = request.getParameter("candyName");
		String candyTaste = request.getParameter("candyTaste");
		String price = request.getParameter("price");
		ArrayList<Candy> result = select.select("", "");
		for(int i = 0;i<result.size();i++){
			if(Integer.parseInt(id) == result.get(i).getId()){
				request.getRequestDispatcher("InsertFail.jsp").forward(request, response);
				return;
			}
		}
		conn = connection.getConnect();
		String sql = "insert into Candy(id,candyName,candyTaste,price) values (?,?,?,?)";
		stat = conn.prepareStatement(sql);
		stat.setInt(1, Integer.parseInt(id));
		stat.setString(2, candyName);
		stat.setString(3, candyTaste);
		stat.setInt(4, Integer.parseInt(price));
		stat.executeUpdate();
		connection.close(stat, conn);
		request.getRequestDispatcher("InsertSuccess.jsp").forward(request, response);
	}

}
