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
				<li class="nav-item"><a class="nav-link font"
					aria-current="page" href="#">Brinquedos</a></li>
				<li class="nav-item"><a class="nav-link font"
					href="../jsp/admProduto.jsp">Administração de brinquedos</a></li>
			</ul>
		</div>
		<div class="container">
			<div class="row">
				<div class="cold-md-7">
					<h3>Cadastro de Usuário</h3>
					<hr>
					<form method="post" action="../CadastrarUsuarioServlet">
					<input type="hidden" name="cmd" value="salvar"/>
						<label>Nome completo</label>
						 <input type="text" id="nomeUsuario" name="nomeUsuario" required class=form-control><br>
						<label>E-mail</label>
						<input type="email" id="email" name="email" required class=form-control><br>
						<label>Senha</label>
						<input type="password" id="senha" name="senha" required class=form-control><br>
						<input class="btn btn-primary" type="submit" value="Cadastrar">
						<button class="btn btn-secondary" type="reset">Limpar Formulário</button>
					</form>
					<br>
				</div>
			</div>
		</div>
</body>
</html>
