package devtoys.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import devtoys.dao.ProdutoDAO;
import devtoys.model.Produto;

/**
 * Servlet implementation class ServeletProduto
 */
@WebServlet("/ServletProduto")
public class ServletProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Produto produto = new Produto();
		ProdutoDAO dao;
		String cmd = request.getParameter("cmd");

		//Este trycatch irá pegar os dados enviados pelos formulario
				if (cmd != null) {
					try {
						produto.setIdProd(Integer.parseInt(request.getParameter("txtId")));
						produto.setNomeProd(request.getParameter("txtNome"));
						produto.setCategoriaProd(request.getParameter("cmbCategoria"));
						produto.setPrecoProd(Float.parseFloat(request.getParameter("Preco")));
						produto.setDescProd(request.getParameter("txtDesc"));
						produto.setImgProd(request.getParameter("txtImg"));
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				try {
					RequestDispatcher rd = null;
					dao = new ProdutoDAO();
					if (cmd.equalsIgnoreCase("incluir")) {
						dao.salvar(produto);
						rd = request.getRequestDispatcher("ServletProduto?listar");
						
						
					} else if (cmd.equalsIgnoreCase("listar")) {
						List<Produto> produtosList = dao.getProdutos();
						request.setAttribute("produtosList", produtosList);
						rd = request.getRequestDispatcher("admProduto.jsp");
						rd.forward(request, response);
						
						
					} else if (cmd.equalsIgnoreCase("atu")) {
						produto = dao.getProdutoById(produto.getIdProd());
						HttpSession session = request.getSession(true);
						session.setAttribute("produto", produto);
						rd = request.getRequestDispatcher("jsp/atualizarProduto.jsp");
						
					} else if (cmd.equalsIgnoreCase("atualizar")) {
						dao.atualizar(produto);
						rd = request.getRequestDispatcher("ServletProduto?cmd=listar");
						
					}else if (cmd.equalsIgnoreCase("con")) {
		                produto = dao.getProdutoById(produto.getIdProd());
		                HttpSession session = request.getSession(true);
		                session.setAttribute("produto", produto);
		                rd = request.getRequestDispatcher("jsp/consultarProduto.jsp");
		                
		            } else if (cmd.equalsIgnoreCase("exc")) {
						produto = dao.getProdutoById(produto.getIdProd());
						HttpSession session = request.getSession(true);
						session.setAttribute("produto", produto);
						rd = request.getRequestDispatcher("jsp/excluirProduto.jsp");
					} else if (cmd.equalsIgnoreCase("excluir")) {
						dao.excluirProduto(produto.getIdProd());
						rd = request.getRequestDispatcher("ServletProduto?cmd=listar");
					}

					//Executa a ação de direcionar para a página JSP
					rd.forward(request, response);
				} catch (Exception e) {
					System.out.println("Erro ao gravar");
					System.out.println(e.getMessage());
				}
				}
			}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
