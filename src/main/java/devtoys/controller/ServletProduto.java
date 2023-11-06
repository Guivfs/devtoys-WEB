package devtoys.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import devtoys.dao.ProdutoDAO;
import devtoys.model.Produto;

/**
 * Servlet implementation class ServletProduto
 */
@WebServlet("/ServletProduto")
public class ServletProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String cmd = request.getParameter("cmd");
    	ProdutoDAO dao;
    	Produto produto = new Produto();
    	if (cmd != null) {
    		try {
    			produto.setIdProd(Integer.parseInt(request.getParameter("txtId")));
    			produto.setNomeProd(request.getParameter("txtNome"));
    			produto.setPrecoProd(Float.parseFloat(request.getParameter("txtPreco")));
    			produto.setCategoriaProd(request.getParameter("txtCategoria"));
    			produto.setDescProd(request.getParameter("txtDesc"));
    			produto.setImgProd(request.getParameter("txtImg"));
    		}catch (Exception ex) {
                ex.printStackTrace();
    		}
    		try {
            // direciona para uma nova página
            RequestDispatcher rd = null;
            dao = new ProdutoDAO();
            if (cmd.equalsIgnoreCase("salvar")) {
                dao.salvar(produto);
                rd = request.getRequestDispatcher("../index.jsp");
            }
    		}catch (Exception e) {
                e.printStackTrace();
                throw new ServletException(e);
            }
    	}
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
