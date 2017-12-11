package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class addusertoDB {


	public static user addUser(String username, String password) {
		user u = new user();
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		PreparedStatement ps = null;
		ConnectionManager connection = new ConnectionManager();
		try {
			conn = connection.getConnect();
			System.out.println("Connected to the database.");

			stmt = conn.createStatement();

			sql = "INSERT INTO userlist (username,password) VALUES(?,?)";

			ps = (PreparedStatement) conn.prepareStatement(sql);

			try {
				ps.setString(1, username);
				ps.setString(2, password);
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			u.name = username;
			u.password = password;

			ps.close();
			stmt.close();
			conn.close();
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		System.out.println("Completed.");
		return u;
	}
}
