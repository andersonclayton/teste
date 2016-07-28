package comparator;

public class Pessoa {
	
	private String nome;
	
	private String profissao;
	
	private String cidade;
	
	public Pessoa(String cidade, String profissão, String nome) {
		this.cidade = cidade;
		this.profissao = profissão;
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getProfissao() {
		return profissao;
	}

	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	
	@Override
	public String toString() {
		return getCidade()+";"+getProfissao()+";"+getNome();
	}
}
