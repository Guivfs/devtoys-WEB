package devtoys.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import devtoys.dao.ProdutoDAO;
import devtoys.dao.UsuarioDao;
import devtoys.model.Produto;
import devtoys.model.Usuario;
import devtoys.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

@WebServlet("/CadastrarUsuarioServlet")
public class CadastrarUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        Usuario usuario = new Usuario();
		UsuarioDao dao;
		String cmd = request.getParameter("cmd");

        String mensagem = "";


		//Este trycatch irá pegar os dados enviados pelos formulario
				if (cmd != null) {
					try {
						usuario.setNomeusua(request.getParameter("nomeUsuario"));
						usuario.setEmail(request.getParameter("email"));
						usuario.setSenhausua(request.getParameter("senha"));
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				try {
					RequestDispatcher rd = null;
					dao = new UsuarioDao();
					if (cmd.equalsIgnoreCase("salvar")) {
						dao.salvar(usuario);
						rd = request.getRequestDispatcher("../index.jsp");	
					}
        } catch (SQLException e) {
            e.printStackTrace();
            mensagem = "Erro ao cadastrar o usuário: " + e.getMessage();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
        }

        request.setAttribute("mensagem", mensagem);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
				}}}

