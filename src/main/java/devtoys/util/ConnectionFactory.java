package devtoys.util;

import java.sql.*;

public class ConnectionFactory {
	
	
	// Este metodo ele cria a nossa conexão com o banco de dados
	public static Connection getConnection() throws Exception {
		String url = "jdbc:mysql://localhost:3306/dbdevtoys";
		String login = "root";
		String senha = "";
		try {
			// Indica qual driver o banco de dados irá utilizar, no nosso caso o (JDBC -> JAVA DATA BASE CONNECTOR)
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver jdbc encontrado!");
			// Estabelece a conexão com o banco de dados, utilizando url, login e senha e retorna a conexão 
			Connection connection = DriverManager.getConnection(url,login,senha);
			System.out.println("Conexão com o banco de dados estabelecida!");
			return connection;
		} catch (Exception e) {
			throw new Exception("Conexão com o banco mal sucedida"+e.getMessage());
		}
	}

	
	// fecha uma conexão de três formas: conn, stmt, rs

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
