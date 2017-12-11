package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DB.ConnectionManager;
import DB.SelectManager;

public class AllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ConnectionManager connection = new ConnectionManager();
	SelectManager select = new SelectManager();

	// doPost方法
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String methodName = request.getParameter("methodName");
		int method = Integer.parseInt(methodName); // 将字符串解析为数字
		try {
			switch (method) {
			case 0:
				insert(request, response);
				break;
			case 1:
				delete(request, response);
				break;
			case 2:
				update(request, response);
				break;
			case 3:
				update1(request, response);
				break;
			case 4:
				query(request, response);
				break;
			case 5:
				dispatch(request, response);
				break;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// doGet方法
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	// 插入方法
	public void insert(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException, ServletException {
		InsertServlet inservletServlet = new InsertServlet();
		inservletServlet.insert(request, response);
	}

	// 条件查询跳转
	public void dispatch(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		SelectServlet selectServlet = new SelectServlet();
		selectServlet.dispatch(request, response);
	}

	// 显示
	public void query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		ShowServlet showServlet = new ShowServlet();
		showServlet.query(request, response);
	}

	// 信息删除方法
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		DeleteServlet delServlet = new DeleteServlet();
		delServlet.delete(request, response);
	}

	// 信息修改方法
	public void update1(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		UpdateModifyServlet updateModifyServlet = new UpdateModifyServlet();
		updateModifyServlet.update1(request, response);
	}

	// 修改后的信息
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		UpdateServlet updateServlet = new UpdateServlet();
		updateServlet.update(request, response);
	}

}
