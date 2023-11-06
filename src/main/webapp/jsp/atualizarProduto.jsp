<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Atualizar Produto</title>
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
.container {
	padding: 20px;
}

.btn-back {
	margin-top: 10px;
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
        <div class="row justify-content-center">
            <div class="col-md-7">
                <h3>Atualização de Produto</h3>
                <hr>
                <form action="ServletProduto" method="post">
                <input type="hidden" name="cmd" value="atualizar"/>
                    <div class="form-floating mb-3">
                        <input name="nomeProduto" maxlength="40" type="text" class="form-control" id="floatingInput1" required>
                        <label for="floatingInput1">Nome do Produto</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="precoProduto" type="text" class="form-control" required>
                        <label for="floatingInput2">Preço</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="categoriaProduto" type="text" class="form-control" required>
                        <label for="floatingInput3">Categoria</label>
                    </div>
                    <div class="form-floating mb-3">
                        <textarea name="descricaoProduto" class="form-control" rows="4" required></textarea>
                        <label for="floatingInput4">Descrição</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="urlImagem" type="text" class="form-control" required>
                        <label for="floatingInput5">URL da Imagem</label>
                    </div>
                    <button class="btn btn-primary" type="submit">Atualizar Produto</button>
                    <a href="admProduto.jsp"><button class="btn btn-success" type="button">Voltar a lista de produtos</button></a>
                </form>
            </div>
        </div>
    </div>
</body>


</html>
