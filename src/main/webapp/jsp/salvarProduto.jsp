<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="devtoys.controller.ServletProduto"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="devtoys.model.Produto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("txtId"));
	String nome = request.getParameter("txtNoe");
	Float preco = Float.parseFloat(request.getParameter("email"));
	String categoria = request.getParameter("cmbCategoria");
	String desc = request.getParameter("txtDesc");
	String img = request.getParameter("txtImg");

	// Dados de conexão com o banco de dados (substitua com suas próprias credenciais)
	String url = "jdbc:mysql://localhost:3306/dbdevtoys";
	String user = "root";
	String password = "";

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, password);

		String sql = "INSERT INTO produtos VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setInt(1, id);
		statement.setString(2, nome);
		statement.setFloat(3, preco);
		statement.setString(4, categoria);
		statement.setString(5, desc);
		statement.setString(6, img);
		statement.executeUpdate();
		conn.close();
	} catch (SQLException | ClassNotFoundException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>