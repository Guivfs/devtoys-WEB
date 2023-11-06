package devtoys.model;
/* Java Bean - É uma classe que contenha todos os atributos privados, possua getters e setters
para seus atributos e usada para encapsular e abstrair uma entidade */

// Objeto(Produto)
public class Produto {
	private int idProd;
	private String nomeProd;
	private float precoProd;
	private String categoriaProd;
	private String descProd;
	private String imgProd;

	// Construtor vazio
	public Produto() {
	}

	// Construtor to string
	@Override
	public String toString() {
		return "Produto [idProd=" + idProd + ", nomeProd=" + nomeProd + ", precoProd=" + precoProd + ", categoriaProd="
				+ categoriaProd + ", descProd=" + descProd + ", imgProd=" + imgProd + "]";
	}

	// Construtor com parâmetros
	public Produto(int idProd, String nomeProd, float precoProd, String categoriaProd, String descProd,
			String imgProd) {
		this.idProd = idProd;
		this.nomeProd = nomeProd;
		this.precoProd = precoProd;
		this.categoriaProd = categoriaProd;
		this.descProd = descProd;
		this.imgProd = imgProd;
	}

	// Getters e Setters
	public int getIdProd() {
		return idProd;
	}

	public void setIdProd(int idProd) {
		this.idProd = idProd;
	}

	public String getNomeProd() {
		return nomeProd;
	}

	public void setNomeProd(String nomeProd) {
		this.nomeProd = nomeProd;
	}

	public float getPrecoProd() {
		return precoProd;
	}

	public void setPrecoProd(float precoProd) {
		this.precoProd = precoProd;
	}

	public String getCategoriaProd() {
		return categoriaProd;
	}

	public void setCategoriaProd(String categoriaProd) {
		this.categoriaProd = categoriaProd;
	}

	public String getDescProd() {
		return descProd;
	}

	public void setDescProd(String descProd) {
		this.descProd = descProd;
	}

	public String getImgProd() {
		return imgProd;
	}

	public void setImgProd(String imgProd) {
		this.imgProd = imgProd;
	}

}
