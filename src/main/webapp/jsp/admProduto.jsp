<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="devtoys.model.Produto"%>
<%@ page import="devtoys.dao.ProdutoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						class="nav-link font" href="">LOGIN</a>
				</div>
		</div>

		<div class="row">
			<ul class="nav nav-tabs centralizar">
				<li class="nav-item"><a class="nav-link font"
					aria-current="page" href="../index.jsp">Brinquedos</a></li>
				<li class="nav-item"><a class="nav-link font active"
					href="jsp/admProduto.jsp">Administração de brinquedos</a></li>
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
	<div class="container">
		<div class="col-12" style="display: flex">
			<h4 class="hover" style="padding: 20px 0px 20px 0px">Lista de
				brinquedos</h4>
			<button type="button" class="btn btn-lg btn-primary" disabled>Primary
				button</button>
		</div>
		<div class="col-12 text-center"></div>
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
			<c:forEach items="${produtosList}" var="produto">
				<tr>
					<td>${produto.idProd}</td>
					<td>${produto.nomeProd}</td>
					<td>${produto.precoProd}</td>
					<td>${produto.categoriaProd}</td>
					<td>${produto.descProd}</td>
					<td>${produto.imgProd}</td>
					<td>
						<button class="btn btn-primary">Atualizar</button>
						<button class="btn btn-danger">Excluir</button>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7">Nenhum produto encontrado.</td>
			</tr>
		</table>









		<div class="container">
			<h1>Cadastro de Produto</h1>
			<form action="seu_servlet_de_destino" method="POST"
				enctype="multipart/form-data">
				<div class="mb-3">
					<label for="nome" class="form-label">Nome do Produto</label> <input
						type="text" class="form-control" id="nome" name="nome" required>
				</div>
				<div class="mb-3">
					<label for="preco" class="form-label">Preço do Produto</label> <input
						type="number" class="form-control" id="preco" name="preco"
						step="0.01" required>
				</div>
				<div class="mb-3">
					<label for="categoria" class="form-label">Categoria</label> <input
						type="text" class="form-control" id="categoria" name="categoria"
						required>
				</div>
				<div class="mb-3">
					<label for="desc" class="form-label">Descrição</label>
					<textarea class="form-control" id="desc" name="desc" rows="4"
						required></textarea>
				</div>
				<div class="mb-3">
					<label for="img" class="form-label">Imagem do Produto</label> <input
						type="file" class="form-control" id="img" name="img"
						accept="image/*" required>
				</div>
				<button type="submit" class="btn btn-primary">Enviar</button>
			</form>
		</div>
	</div>
</body>
</html>