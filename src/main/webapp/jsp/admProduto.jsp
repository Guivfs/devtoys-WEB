<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="devtoys.model.Produto"%>
<%@ page import="devtoys.dao.ProdutoDAO"%>
<%@ page import="devtoys.controller.ServletProduto"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.DataSource"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Administraï¿½ï¿½o</title>
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
</head>

<body>
	<!-- ~~~~~~~~~~~~~~~~ NAVBAR ~~~~~~~~~~~~~~~~ -->
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
				<li class="nav-item"><a class="nav-link font"
					href="admProduto.jsp">Administraï¿½ï¿½o de brinquedos</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link font dropdown-toggle" data-bs-toggle="dropdown"
					href="#" role="button" aria-expanded="false">Catï¿½logo</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- ~~~~~~~~~~~~~~~~ NAVBAR ~~~~~~~~~~~~~~~~ -->
	<!-- ~~~~~~~~~~~~~~~~ TABELA ~~~~~~~~~~~~~~~~ -->
	<div class="container">
		<div class="col-12" style="display: flex">
			<h4 class="hover" style="padding: 20px 0px 20px 0px">Lista de
				brinquedos</h4>
			<a href="cadastroProduto.jsp"><button type="button"
					class="btn btn-lg btn-primary" disabled>Primary button</button> </a>
		</div>
		<div class="col-12 text-center"></div>
		<table class="table table-hover" href="ServletProduto?listar"
			style="width: 100%;">
			<colgroup>
				<col style="width: 10%;">
				<!-- Define a largura da coluna ID -->
				<col style="width: 20%;">
				<!-- Define a largura da coluna Nome -->
				<col style="width: 10%;">
				<!-- Define a largura da coluna Preço -->
				<col style="width: 20%;">
				<!-- Define a largura da coluna Categoria -->
				<col style="width: 30%;">
				<!-- Define a largura da coluna Descrição -->
				<col style="width: 10%;">
				<!-- Define a largura da coluna Imagem -->
				<col style="width: 10%;">
				<!-- Define a largura da coluna Ação -->
			</colgroup>
			<thead>
				<tr class="table-group">
					<th scope="col">ID</th>
					<th scope="col">Nome</th>
					<th scope="col">Preço</th>
					<th scope="col">Categoria</th>
					<th scope="col">Descrição</th>
					<th scope="col">Imagem</th>
					<th scope="col">Ação</th>
				</tr>
			</thead>
			<%
			try {
				// Inicializa a conexão com o banco de dados (você pode ter que alterar essas configurações para corresponder ao seu ambiente)
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbdevtoys", "root", "root");

				// Consulta SQL para buscar todos os brinquedos
				String query = "SELECT * FROM produtos";
				PreparedStatement ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery();

				// Itera pelos resultados e exibe-os na tabela
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("idprod")%></td>
				<td><%=rs.getString("nomeprod")%></td>
				<td><%=rs.getFloat("precoprod")%></td>
				<td><%=rs.getString("categoriaprod")%></td>
				<td><%=rs.getString("descprod")%></td>
				<td><%=rs.getString("imgprod")%></td>
				<td scope="acao">
					<button class="btn btn-primary">Atualizar</button>
					<button class="btn btn-danger">Excluir</button>
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
</body>
</html>