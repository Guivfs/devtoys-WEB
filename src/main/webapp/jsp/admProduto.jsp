<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Administração</title>
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../assets/fonts/fonts.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="shortcut icon" href="../assets/img/favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
<style>
a {
color: white;
text-decoration: none;
}
table {
	width: 100%;
}

/* Adiciona um estilo para tornar a tabela responsiva */
@media ( max-width : 768px) {
	.table-responsive {
		display: block;
		width: 100%;
		overflow-x: auto;
	}
}
</style>
</head>

<body>
	<div class="container-fluid --bs-body-bg" id="nav">
		<div class="row">
			<img src="../assets/img/colorido.png">
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid" id="navbar">
					<a class="nav-link font" href="../index.jsp"><img id="logo"
						src="../assets/img/logo.png"></a> <a class="nav-link font"
						href="../index.jsp">HOME</a> <a class="nav-link font"
						href="../html/equipe.html">EQUIPE</a> <a class="nav-link font"
						class="nav-link font" href="../html/loginUsuario.html">LOGIN</a>
				</div>
		</div>
		<div class="row">
			<ul class="nav nav-tabs centralizar">
				<li class="nav-item"><a class="nav-link font"
					aria-current="page" href="../index.jsp">Brinquedos</a></li>
				<li class="nav-item"><a class="nav-link font active"
					href="admProduto.jsp">Administração de produto</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center">
			<h4 class="mb-4">Lista de Produtos</h4>
			<a href="cadastroProduto.jsp" class="btn btn-primary">Cadastro de
				Produto</a>
		</div>
		<!-- Adiciona a classe .table-responsive para tornar a tabela responsiva -->
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th class="col-1">ID</th>
						<th class="col-2">Nome</th>
						<th class="col-1">Preço</th>
						<th class="col-2">Categoria</th>
						<th class="col-2">Descrição</th>
						<th class="col-2">Imagem</th>
						<th class="col-2">Ação</th>
					</tr>
				</thead>
				<%
				try {
					// Inicializa a conexão com o banco de dados (você pode ter que alterar essas configurações para corresponder ao seu ambiente)
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbdevtoys", "root", "");

					// Consulta SQL para buscar todos os brinquedos
					String query = "SELECT * FROM produtos";
					PreparedStatement ps = conn.prepareStatement(query);
					ResultSet rs = ps.executeQuery();

					// Itera pelos resultados e exibe-os na tabela
					  // Iterar pelos resultados e gerar um card para cada item
                    while (rs.next()) {
                    	int idProd = rs.getInt("idProd");
                        String nomeprod = rs.getString("nomeprod");
                        String descricao = rs.getString("descprod");
                        float preco = rs.getFloat("precoprod");
                        String categoriaprod = rs.getString("categoriaprod");
                        String imgprod = rs.getString("imgprod");
				%>
				<tr>
					<td><%=rs.getInt("idProd")%></td>
					<td><%=rs.getString("nomeprod")%></td>
					<td><%=rs.getFloat("precoprod")%></td>
					<td><%=rs.getString("categoriaprod")%></td>
					<td><%=rs.getString("descprod")%></td>
					<td><img src="<%=rs.getString("imgprod")%>"
						style="max-width: 100px; max-height: 100px;"></td>
					<td>
						<button class="btn btn-primary"><a href="atualizarProduto.jsp">Atualizar</a></button>
						<button class="btn btn-danger"><a href="../ServletProduto?cmd=excluir&id=<%=rs.getInt("idprod")%>">Excluir</a></button>
					</td>
				</tr>
				 <%
				}
				// Fecha os recursos
				rs.close();
				ps.close();
				conn.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
		</div>
	</div>
</body>

</html>
