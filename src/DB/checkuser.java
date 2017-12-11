package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class checkuser {

	public static user check(String username,String password) {
		user u = new user();
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		ConnectionManager connection = new ConnectionManager();
		try {

			conn = connection.getConnect();
			System.out.println("Connected to the database.");


//			 sql = "SELECT username, password FROM userlist WHERE username="+
//			 username;
			sql = "SELECT * FROM userlist WHERE 1=1 and username=? and password=?";

			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				u.name = rs.getString("username");
				u.password = rs.getString("password");

			} else {

				return null;
			}
			rs.close();
			ps.close();
			conn.close();

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException se2) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}

			System.out.println("Completed.");

		}

		return u;

	}
}
