package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ConnectionManager;
import DB.SelectManager;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SelectManager select = new SelectManager();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			update(request,response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    
    //修改后的信息
    public void update(HttpServletRequest request, HttpServletResponse response) 
    throws ClassNotFoundException, SQLException, ServletException, IOException{
    	ConnectionManager connection = new ConnectionManager();
    	Connection conn = null;
    	PreparedStatement stat = null;
        String id = request.getParameter("id");
        String candyName = request.getParameter("candyName");
        String candyTaste = request.getParameter("candyTaste");
        String price = request.getParameter("price");
        conn = connection.getConnect();
    	String sql = "update Candy set id= ?,candyName=?,candyTaste=?,price=? where id= ?";
    	stat = conn.prepareStatement(sql);
    	stat.setInt(1, Integer.parseInt(id));
    	stat.setString(2, candyName);
    	stat.setString(3,candyTaste);
    	stat.setInt(4,Integer.parseInt(price));
    	stat.setInt(5, Integer.parseInt(id));
    	stat.executeUpdate();
    	connection.close(stat, conn);
		request.setAttribute("result", select.select(id,""));    
	    request.getRequestDispatcher("update.jsp").forward(request, response); 
    } 

}
