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
					<a class="nav-link font" href="../index.jsp"><img id="logo"
						src="../assets/img/logo.png"></a> <a class="nav-link font"
						href="../index.jsp">HOME</a> <a class="nav-link font"
						href="../html/equipe.html">EQUIPE</a> <a class="nav-link font"
						href="../html/loginUsuario.html">LOGIN</a>
				</div>
		</div>

		<div class="row">
			<ul class="nav nav-tabs centralizar">
				<li class="nav-item"><a class="nav-link font "
					aria-current="page" href="#">Brinquedos</a></li>
				<li class="nav-item"><a class="nav-link font active"
					href="../jsp/admProduto.jsp">Administração de produto</a></li>
			</ul>
		</div>
		<div class="container">
        <div class="row">
            <div class="col-md-7 mx-auto">
                <h3>Cadastro de Produto</h3>
                <hr>
                <form action="admProduto.jsp" method="get" enctype="multipart/form-data">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="txtNome" name="txtNome" required>
                        <label for="txtNome">Nome do Produto</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="numPreco" name="numPreco" step="0.01" required>
                        <label for="numPreco">Preço do Produto</label>
                    </div>
                    <select name="cmbCategoria" class="form-select mb-3" aria-label="Default select example">
                        <option value="" disabled selected>-- Selecione a categoria</option>
                        <option value="Games">Games</option>
                        <option value="Mario">Mario</option>
                        <option value="HotWhells">HotWhells</option>
                        <option value="Acao">Acao</option>
                        <option value="Lego">Lego</option>
                        <option value="Jogos">Jogos</option>
                        <option value="Bonecas">Bonecas</option>
                        <option value="Bebes">Bebes</option>
                    </select>
                    <div class="form-floating mb-3">
                        <textarea class="form-control" id="txtDesc" name="txtDesc" rows="4" required></textarea>
                        <label for="txtDesc">Descrição</label>
                    </div>
                    <div class="form mb-3">
                        <label for="txtImg">Imagem do Produto</label>
                        <input type="file" class="form-control" id="txtImg" name="txtImg" accept="image/*" required>
                    </div>
                    <button class="btn btn-primary" type="submit">Enviar</button>
                    <button class="btn btn-secondary" type="reset">Limpar Formulário</button>
                    <a href="admProduto.jsp"><button class="btn btn-secundary" type="button">Voltar a lista de produtos</button></a>
                </form>
                <br>
            </div>
        </div>
    </div>

    </div>

</body>
</html>