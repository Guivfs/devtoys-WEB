<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%--Importações --%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
</head>
<body>
    <h1>Olá mundo</h1>
    <%= "teste jsp" %>
    <p>Data: <%= new Date() %></p>
    <%
        int contador = 0;
        contador++; // Incrementa o contador
    %>
    <p>Visitas: <%= contador %></p>
</body>
</html>
