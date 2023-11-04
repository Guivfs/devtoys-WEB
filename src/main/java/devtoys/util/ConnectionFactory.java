package devtoys.util;

import java.sql.*;

public class ConnectionFactory {

	public static Connection getConnection() throws Exception {

		try {

			// indica qual � o banco de dados que estou utilizando e seu driver

			Class.forName("com.mysql.jdbc.Driver");
			
			// estabelece a conexao e retorna uma conexao
			String login = "root";
			String senha = "root";
			String url = "jdbc:mysql://localhost:3306/dbdevtoys";

			return DriverManager.getConnection(url,login,senha);
		} catch (Exception e) {
			System.out.println("Conexão com o banco de dados estabelecida");
			throw new Exception(e.getMessage());
		}
	}

	// fecha uma conex�o de tr�s formas: conn, stmt, rs

	public static void closeConnection(Connection conn, Statement stmt,
			ResultSet rs) throws Exception {
		close(conn, stmt, rs);
	}

	public static void closeConnection(Connection conn, Statement stmt)
			throws Exception {
		close(conn, stmt, null);
	}

	public static void closeConnection(Connection conn) throws Exception {
		close(conn, null, null);
	}

	private static void close(Connection conn, Statement stmt, ResultSet rs)
			throws Exception {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
	}
}
