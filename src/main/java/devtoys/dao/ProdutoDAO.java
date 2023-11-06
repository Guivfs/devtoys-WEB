package devtoys.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import devtoys.model.Produto;
import devtoys.util.ConnectionFactory;

// DAO (DATA ACCESS OBJECT) -> CAMADA DE PERSISTÊNCIA
public class ProdutoDAO {

    // Classes de banco de dados
    private Connection conn; // Abre a conexão do banco de dados

    public ProdutoDAO() throws Exception {
        // Chama a classe ConnectionFactory e estabelece uma conexão
        try {
            this.conn = ConnectionFactory.getConnection();
        } catch (Exception e) {
            throw new Exception("Erro: \n" + e.getMessage());
        }
    }

    // ~~~~~~~~~~~~~~~~~~~~~~~~ GET ~~~~~~~~~~~~~~~~~~~~~~~~
    public List<Produto> getProdutos() throws Exception {
        List<Produto> lista = new ArrayList<>();

        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM produtos");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("idprod");
                String nome = rs.getString("nomeprod");
                float preco = rs.getFloat("precoprod");
                String desc = rs.getString("descprod");
                String categoria = rs.getString("categoriaprod");
                String img = rs.getString("imgprod");

                Produto produto = new Produto(id, nome, preco, desc, categoria, img);
                lista.add(produto);
            }
        } catch (Exception sqle) {
            throw new Exception("Erro ao obter os produtos " + sqle);
        } finally {
            ConnectionFactory.closeConnection(conn);
        }

        return lista;
    }

    // ~~~~~~~~~~~~~~~~~~~~~~~~ GET(ONE) ~~~~~~~~~~~~~~~~~~~~~~~~
    public Produto getProdutoById(int idProduto) throws Exception {
        Produto produto = null;
        String SQL = "SELECT * FROM produtos WHERE idprod = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setInt(1, idProduto);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("idprod");
                String nome = rs.getString("nomeprod");
                float preco = rs.getFloat("precoprod");
                String desc = rs.getString("descprod");
                String categoria = rs.getString("categoriaprod");
                String img = rs.getString("imgprod");

                produto = new Produto(id, nome, preco, desc, categoria, img);
            }
        } catch (Exception sqle) {
            throw new Exception("Erro ao obter o produto " + sqle);
        } finally {
            ConnectionFactory.closeConnection(conn);
        }

        return produto;
    }

    // ~~~~~~~~~~~~~~~~~~~~~~~~ INSERIR ~~~~~~~~~~~~~~~~~~~~~~~~
    public void salvar(Produto produto) throws Exception {
        if (produto == null) {
            throw new Exception("O valor passado não pode ser nulo");
        }

        String SQL = "INSERT INTO produtos (nomeprod, precoprod, categoriaprod, descprod, imgprod) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, produto.getNomeProd());
            ps.setFloat(2, produto.getPrecoProd());
            ps.setString(3, produto.getCategoriaProd());
            ps.setString(4, produto.getDescProd());
            ps.setString(5, produto.getImgProd());

            ps.executeUpdate();
        } catch (Exception sqle) {
            throw new Exception("Erro ao salvar dados " + sqle);
        } finally {
            ConnectionFactory.closeConnection(conn);
        }
    }

    // ~~~~~~~~~~~~~~~~~~~~~~~~ ATUALIZAR ~~~~~~~~~~~~~~~~~~~~~~~~
    public void atualizar(Produto produto) throws Exception {
        if (produto == null) {
            throw new Exception("O valor passado não pode ser nulo");
        }

        String SQL = "UPDATE produtos SET nomeprod = ?, precoprod = ?, categoriaprod = ?, descprod = ?, imgprod = ? WHERE idprod = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
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
            ConnectionFactory.closeConnection(conn);
        }
    }

    // ~~~~~~~~~~~~~~~~~~~~~~~~ EXCLUIR ~~~~~~~~~~~~~~~~~~~~~~~~
    public void excluirProduto(int idProduto) throws Exception {
        String SQL = "DELETE FROM produtos WHERE idprod = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setInt(1, idProduto);
            ps.executeUpdate();
        } catch (Exception sqle) {
            throw new Exception("Erro ao excluir dados " + sqle);
        } finally {
            ConnectionFactory.closeConnection(conn);
        }
    }
}
