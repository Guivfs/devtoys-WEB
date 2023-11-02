<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="devtoys.model.Produto"%>
<%@ page import="devtoys.dao.ProdutoDAO"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lista de brinquedos</title>
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../assets/fonts/fonts.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="shortcut icon" href="assets/img/favicon.ico"
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
						href="../html/equipe.html">EQUIPE</a> <a class="nav-link font"
						href="">LOGIN</a>
				</div>
		</div>

		<div class="row">
			<ul class="nav nav-tabs centralizar">
				<li class="nav-item"><a class="nav-link font"
					aria-current="page" href="#">Brinquedos</a></li>
				<li class="nav-item"><a class="nav-link font active"
					href="jsp/admBrinquedos.jsp">Administração de brinquedos</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link font dropdown-toggle" data-bs-toggle="dropdown"
					href="#" role="button" aria-expanded="false">Catálogo</a>
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
	<div class="container"></div>
	<div class="col-12 text-center">
		<h3>Lista de brinquedos</h3>

		<table class="table table-hover">
			<thead>
				<tr class="table-group">
					<th class="col" scope="id">ID</th>
					<th class="col" scope="nome">Nome</th>
					<th class="col" scope="preço">Preço</th>
					<th class="col" scope="categoria">Categoria</th>
					<th class="col" scope="desc">Descrição</th>
					<th class="col" scope="img">Imagem</th>
					<th class="col" scope="acao">Ação</th>
				</tr>
			</thead>
			<%
			List<Produto> lista = (List<Produto>) request.getAttribute("produtosList");

			for (Produto produto : lista) {
			%>
			<tbody class="table-group-divider">
				<tr>
					<td scope="id"><%=produto.getIdProd()%></td>
					<td scope="nome"><%=produto.getNomeProd()%></td>
					<td scope="preço"><%=produto.getPrecoProd()%></td>
					<td scope="categoria"><%=produto.getCategoriaProd()%></td>
					<td scope="desc"><%=produto.getDescProd()%></td>
					<td scope="img"><%=produto.getImgProd()%></td>
					<td scope="acao">
						<!-- Adicione ação aqui -->
					</td>
				</tr>
			</tbody>
			<%
			}
			%>

		</table>

	</div>
</body>

</html>