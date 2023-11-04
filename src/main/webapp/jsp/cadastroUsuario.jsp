<!DOCTYPE html>
<html>
<head>
<title>Cadastro de Usuário</title>
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
					<a class="nav-link font" href="../index.jsp"><img id="logo"
						src="../assets/img/logo.png"></a> <a class="nav-link font"
						href="../index.jsp">HOME</a> <a class="nav-link font"
						href="../html/equipe.html">EQUIPE</a> <a class="nav-link font"
						href="../html/loginUsuario.html">LOGIN</a>
				</div>
		</div>

		<div class="row">
			<ul class="nav nav-tabs centralizar">
				<li class="nav-item"><a class="nav-link font active"
					aria-current="page" href="#">Brinquedos</a></li>
				<li class="nav-item"><a class="nav-link font"
					href="../jsp/admProduto.jsp">Administraï¿½ï¿½o de brinquedos</a></li>
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
		<div class="container">
			<h1 class="mt-5">Cadastro de Usuário</h1>
			<form action="CadastrarUsuarioServlet" method="post">
				<div class="form-group">
					<label for="nome">Nome:</label> <input type="text"
						class="form-control" id="nome" name="nome" required>
				</div>

				<div class="form-group">
					<label for="email">E-mail:</label> <input type="email"
						class="form-control" id="email" name="email" required>
				</div>

				<div class="form-group">
					<label for="senha">Senha:</label> <input type="password"
						class="form-control" id="senha" name="senha" required>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="tipo" id="admin"
						value="admin"> <label class="form-check-label" for="admin">
						Admin </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="tipo"
						id="usuario" value="usuario" checked> <label
						class="form-check-label" for="usuario"> Usuário </label>
				</div>

				<button type="submit" class="btn btn-primary">Enviar</button>
			</form>
		</div>
</body>
</html>
