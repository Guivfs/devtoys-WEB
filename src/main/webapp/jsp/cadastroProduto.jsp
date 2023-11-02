<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro</title>
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
<div class="container-fluid --bs-body-bg" id="nav">
        <div class="row">
            <img src="../assets/img/colorido.png">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid" id="navbar">
                    <a class="nav-link font" href="../index.jsp"><img id="logo" src="../assets/img/logo.png"></a>
                    <a class="nav-link font" href="../index.jsp">HOME</a>
                    <a class="nav-link font" href="../html/equipe.html">EQUIPE</a>
                    <a class="nav-link font" href="">LOGIN</a>
                </div>
        </div>

        <div class="row">
            <ul class="nav nav-tabs centralizar">
                <li class="nav-item">
                    <a class="nav-link font active" aria-current="page" href="#">Brinquedos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font" href="../jsp/admProduto.jsp">Administra��o de brinquedos</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link font dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                        aria-expanded="false">Cat�logo</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    <div class="container">
        <h1>Cadastro de Produto</h1>
        <form action="seu_servlet_de_destino" method="POST"
            enctype="multipart/form-data">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome do Produto</label> <input
                    type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="mb-3">
                <label for="preco" class="form-label">Pre�o do Produto</label> <input
                    type="number" class="form-control" id="preco" name="preco"
                    step="0.01" required>
            </div>
            <div class="mb-3">
                <label for="categoria" class="form-label">Categoria</label> <input
                    type="text" class="form-control" id="categoria" name="categoria"
                    required>
            </div>
            <div class="mb-3">
                <label for="desc" class="form-label">Descri��o</label>
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
</body>
</html>