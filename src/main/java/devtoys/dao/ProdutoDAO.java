package devtoys.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import devtoys.model.Produto;
import devtoys.util.ConnectionFactory;

//DAO (DATA ACEESS OBJECT) -> CAMADA DE PERSISTÊNCIA
public class ProdutoDAO {

	// classes de banco de dados
	private Connection conn; // abre a conexao do banco de dados
	private PreparedStatement ps; // permite que scripts SQL sejam executados a partir do Java
	private ResultSet rs; // representa as tabelas
	
	
	// classe JavaBean
	private Produto produto;

	public ProdutoDAO() throws Exception {
		// chama a classe ConnectionFactory e estabele uma conexao
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~ GET ~~~~~~~~~~~~~~~~~~~~~~~~
	public List<Produto> getProdutos() throws Exception {
	    try {
	        ps = conn.prepareStatement("SELECT * FROM produtos");
	        ResultSet rs = ps.executeQuery();
	        List<Produto> lista = new ArrayList<Produto>();
	        while (rs.next()) {
	        	int id = rs.getInt("idProd");
	        	String nome = rs.getString("nomeProd");
	        	float preco = rs.getFloat("precoProd");
	        	String desc = rs.getString("descProd");
	        	String categoria = rs.getString("categoriaProd");
	        	String img = rs.getString("imgProd");
	            lista.add(new Produto(id,nome,preco,desc,categoria,img));
	            System.out.println("Produtos: " + lista);
	        }
	        return lista;
	    } catch (Exception sqle) {
	        throw new Exception("Erro ao obter os produtos " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps);
	    }
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~GET(ONE)~~~~~~~~~~~~~~~~~~~~~~~~
	public Produto getProdutoById(int idProduto) throws Exception {
	    Produto produto = null;
	    String SQL = "SELECT * FROM produtos WHERE id = ?";

	    try {
	        ps = conn.prepareStatement(SQL);
	        ps.setInt(1, idProduto);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            produto = new Produto();
	            produto.setIdProd(rs.getInt("id"));
	            produto.setNomeProd(rs.getString("nome"));
	            produto.setPrecoProd(rs.getFloat("preco"));
	            produto.setCategoriaProd(rs.getString("categoria"));
	            produto.setDescProd(rs.getString("descricao"));
	            produto.setImgProd(rs.getString("imagem"));
	        }
	    } catch (Exception sqle) {
	        throw new Exception("Erro ao obter o produto " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps);
	    }
	    return produto;
	}

	//~~~~~~~~~~~~~~~~~~~~~~~~ INSERIR ~~~~~~~~~~~~~~~~~~~~~~~~
	public void salvar(Produto produto) throws Exception {
		if (produto == null) {
			throw new Exception("O valor passado não pode ser nulo");
		}

		String SQL = "INSERT INTO produtos (id, nome, preco, categoria, descricao, imagem) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, produto.getIdProd());
			ps.setString(2, produto.getNomeProd());
			ps.setFloat(3, produto.getPrecoProd());
			ps.setString(4, produto.getCategoriaProd());
			ps.setString(5, produto.getDescProd());
			ps.setString(6, produto.getImgProd());
			ps.executeUpdate();
		} catch (Exception sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}
	//~~~~~~~~~~~~~~~~~~~~~~~~ ATUALIZAR ~~~~~~~~~~~~~~~~~~~~~~~~
	public void atualizar(Produto produto) throws Exception {
	    if (produto == null) {
	        throw new Exception("O valor passado não pode ser nulo");
	    }

	    String SQL = "UPDATE produtos SET nome = ?, preco = ?, categoria = ?, descricao = ?, imagem = ? WHERE id = ?";

	    try {
	        ps = conn.prepareStatement(SQL);
	        ps.setString(1, produto.getNomeProd());
	        ps.setFloat(2, produto.getPrecoProd());
	        ps.setString(3, produto.getCategoriaProd());
	        ps.setString(4, produto.getDescProd());
	        ps.setString(5, produto.getImgProd());
	        ps.setInt(6, produto.getIdProd());
	        ps.executeUpdate();
	    } catch (Exception sqle) {
	        throw new Exception("Erro ao atualizar dados " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps);
	    }
	}
	//~~~~~~~~~~~~~~~~~~~~~~~~ EXCLUIR ~~~~~~~~~~~~~~~~~~~~~~~~
	public void excluirProduto(int idProduto) throws Exception {
	    String SQL = "DELETE FROM produtos WHERE id = ?";

	    try {
	        ps = conn.prepareStatement(SQL);
	        ps.setInt(1, idProduto);
	        ps.executeUpdate();
	    } catch (Exception sqle) {
	        throw new Exception("Erro ao excluir dados " + sqle);
	    } finally {
	        ConnectionFactory.closeConnection(conn, ps);
	    }
	}
	

}
