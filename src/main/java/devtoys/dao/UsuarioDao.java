package devtoys.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import devtoys.model.Usuario;
import devtoys.util.ConnectionFactory;

//DAO (DATA ACEESS OBJECT) -> CAMADA DE PERSISTÊNCIA
public class UsuarioDao {
	
	private Connection conn; // abre a conexao do banco de dados
	private PreparedStatement ps; // permite que scripts SQL sejam executados a partir do Java
	private ResultSet rs; 
	
	private Usuario usuario;
	
	public void salvar(Usuario usuario) throws Exception {
		if (usuario == null) 
			throw new Exception("O valor passado não pode ser nulo");
		try {
			String SQL = "INSERT INTO usuario (nomeusua, emailusua, senhausua) VALUES" 
					+ " (?, ?, ?)";
			
			ps = conn.prepareStatement(SQL);
			ps.setString(1, usuario.getNomeusua());
			ps.setString(2, usuario.getEmail());
			ps.setString(3, usuario.getSenhausua());
			ps.executeUpdate();
		} catch (Exception sqle) {
			throw new Exception("Erro ao salvar dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
		}
}