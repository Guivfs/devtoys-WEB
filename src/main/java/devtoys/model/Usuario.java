package devtoys.model;

// Objeto(Usuario)
public class Usuario {
	private int id;
	private String email;
	private String senha;
	private String permissao;

	// Construtor vazio
	public Usuario() {
	}

	// Construtor to string
	@Override
	public String toString() {
		return "Usuario [id=" + id + ", email=" + email + ", senha=" + senha + ", permissao=" + permissao + "]";
	}

	// Construtor com parâmetros
	public Usuario(int id, String email, String senha, String permissao) {
		this.id = id;
		this.email = email;
		this.senha = senha;
		this.permissao = permissao;
	}

	// Getters e Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getPermissao() {
		return permissao;
	}

	public void setPermissao(String permissao) {
		this.permissao = permissao;
	}
}
