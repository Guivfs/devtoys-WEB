 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="assets/fonts/fonts.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
        crossorigin="anonymous"></script>
        <style>
    .card {
        display: flex;
    }

    .box {
        flex: 1; /* Expande para preencher o espaço igualmente */
    }
</style>
        
</head>

<body>
    <div class="container-fluid --bs-body-bg" id="nav">
        <div class="row">
            <img src="assets/img/colorido.png">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid" id="navbar">
                    <a class="nav-link font" href="index.jsp"><img id="logo" src="assets/img/logo.png"></a>
                    <a class="nav-link font" href="index.jsp">HOME</a>
                    <a class="nav-link font" href="html/equipe.html">EQUIPE</a>
                    <a class="nav-link font" href="html/loginUsuario.html">LOGIN</a>
                </div>
        </div>

        <div class="row">
            <ul class="nav nav-tabs centralizar">
                <li class="nav-item">
                    <a class="nav-link font active" aria-current="page" href="index.jsp">Brinquedos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link font" href="jsp/admProduto.jsp">Administração de produto</a>
                </li>
            </ul>
        </div>

        <div class="row">
            <p>
            <h3>Categoria</h3>
            </p>
            <div class="col-12" id="carousel">
                <div id="carouselExample" class="carousel slide carousel-dark">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="row">
                                <div class="col-2"></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/game.png">
                                        <p>GAMES</p>
                                    </a></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/mario.png">
                                        <p>MARIO</p>
                                    </a></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/hotwheels.png">
                                        <p>HOT WHEELS</p>
                                    </a></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/figurinhaacao.png">
                                        <p>BONECOS DE AÇÃO</p>
                                    </a></div>
                                <div class="col-2"></div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row">
                                <div class="col-2"></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/lego.png">
                                        <p>LEGO</p>
                                    </a></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/jogos.png">
                                        <p>JOGOS</p>
                                    </a></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/barbie.png">
                                        <p>BONECAS</p>
                                    </a></div>
                                <div class="col-2 nav-link"><a href=""><img src="assets/img/bebe.png">
                                        <p>BEBÊS</p>
                                    </a></div>
                                <div class="col-2"></div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
        </div>
        <div class="row">
            <h2 align="center">Brinquedos</h2>
            <div style="background-color: #f8f9fa">
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
                        String nomeprod = rs.getString("nomeprod");
                        String descricao = rs.getString("descprod");
                        float preco = rs.getFloat("precoprod");
                        String categoriaprod = rs.getString("categoriaprod");
                        String imgprod = rs.getString("imgprod");
				%>                
				<div class="card" style="float: left; width: 50%; width: 250px; height:100px " >
  					<img class="card-img" style=" width: 250px; height:250px" src="<%= imgprod %>" alt="<%= imgprod %>">
  					<div class="card-body">
    					<h5 class="card-title"><%=nomeprod%></h5>
   						<p class="card-text"><%= descricao %></p>
    					<a href="#" class="btn btn-primary">Ver Produto</a>
  					</div>
				</div>
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
            </div>
        </div>
    </div>
</body>

</html>