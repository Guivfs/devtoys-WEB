<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Excluir Produto</title>
</head>
<body>
    <%
    int id = Integer.parseInt(request.getParameter("txtId"));

    // Dados de conexão com o banco de dados (substitua com suas próprias credenciais)
    String url = "jdbc:mysql://localhost:3306/dbdevtoys";
    String user = "root";
    String password = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "DELETE FROM produtos WHERE idprod = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
        conn.close();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
