package devtoys.controller;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
//Camada de Controle
/**
* Servlet implementation class ServletAluno
*/
@WebServlet("/ServletProdutoTeste")
public class ServletProduto extends HttpServlet {
private static final long serialVersionUID = 1L;

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
Produto produto = new Produto();
ProdutoDAO dao;
String cmd = request.getParameter("cmd");

try {
	//Put and Post
if (cmd.equals("cadastrar") || cmd.equals("atualizar") ) {
produto.setIdProd(Integer.parseInt(request.getParameter("txtId")));
produto.setNomeProd(request.getParameter("txtNome"));
produto.setPrecoProd(Integer.parseInt(request.getParameter("txtPreco")));
produto.setCategoriaProd(request.getParameter("cmbCateria"));
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
// Dispatcher - direciona para uma nova página
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
dao.excluirProduto(produto);
rd = request.getRequestDispatcher("ServletAluno?cmd=listar");
}
// executa a ação de direcionar para a página JSP
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