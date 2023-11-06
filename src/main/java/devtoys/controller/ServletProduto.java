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

@WebServlet("/ServletProduto")
public class ServletProduto extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Produto produto = new Produto();
        ProdutoDAO dao;
        String cmd = request.getParameter("cmd");

        try {
            if (cmd.equals("cadastrar") || cmd.equals("atualizar")) {
                produto.setIdProd(Integer.parseInt(request.getParameter("txtId")));
                produto.setNomeProd(request.getParameter("txtNome"));
                produto.setPrecoProd(Float.parseFloat(request.getParameter("txtPreco")));
                produto.setCategoriaProd(request.getParameter("cmbCategoria"));
                produto.setDescProd(request.getParameter("txtDesc"));
                produto.setImgProd(request.getParameter("txtImg"));
            } else {
                produto.setIdProd(Integer.parseInt(request.getParameter("txtId")));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        try {
            dao = new ProdutoDAO();
            RequestDispatcher rd = null;

            if (cmd.equalsIgnoreCase("cadastrar")) {
                dao.salvar(produto);
                rd = request.getRequestDispatcher("ServletProduto?cmd=listar");
            } else if (cmd.equalsIgnoreCase("listar")) {
                List<Produto> produtoList = dao.getProdutos();
                request.setAttribute("produtoList", produtoList);
                rd = request.getRequestDispatcher("jsp/admProduto.jsp");
            } else if (cmd.equalsIgnoreCase("atu")) {
                produto = dao.getProdutoById(produto.getIdProd());
                HttpSession session = request.getSession(true);
                session.setAttribute("produto", produto);
                rd = request.getRequestDispatcher("jsp/atualizarProduto.jsp");
            } else if (cmd.equalsIgnoreCase("atualizar")) {
                dao.atualizar(produto);
                rd = request.getRequestDispatcher("ServletProduto?cmd=listar");
            } else if (cmd.equalsIgnoreCase("con")) {
                produto = dao.getProdutoById(produto.getIdProd());
                HttpSession session = request.getSession(true);
                session.setAttribute("produto", produto);
                rd = request.getRequestDispatcher("jsp/consultarProduto.jsp");
            } else if (cmd.equalsIgnoreCase("exc")) {
                produto = dao.getProdutoById(produto.getIdProd());
                HttpSession session = request.getSession(true);
                session.setAttribute("produto", produto);
                rd = request.getRequestDispatcher("jsp/deletarProduto.jsp");
            } else if (cmd.equalsIgnoreCase("excluir")) {
                dao.excluirProduto(produto.getIdProd());
                rd = request.getRequestDispatcher("jsp/admProduto.jsp");
            }

            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
