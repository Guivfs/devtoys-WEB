package devtoys.model;

// Objeto(Usuario)
public class Usuario {
	private String nomeusua;
	private String email;
	
	public Usuario() {
		super();
	}
	public String getNomeusua() {
		return nomeusua;
	}
	public void setNomeusua(String nomeusua) {
		this.nomeusua = nomeusua;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenhausua() {
		return senhausua;
	}
	public void setSenhausua(String senhausua) {
		this.senhausua = senhausua;
	}
	private String senhausua;
}
