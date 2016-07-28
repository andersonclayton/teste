package comparator;

import java.util.Comparator;

public class ComparadorPorCidadeEProfissao implements Comparator<Pessoa>{
	
	@Override
	public int compare(Pessoa o1, Pessoa o2) {
	      int cidade = o1.getCidade().compareTo(o2.getCidade());
	       if (cidade != 0) return cidade; //Caso as cidades sejam diferentes, ordena pela cidade.
	       //Se forem iguais, vamos ordenar pela profissão.
	   int prof = o1.getProfissao().compareTo(o2.getProfissao());
	   if (prof != 0) return prof; 

	   //Se as profissões forem iguais, ordenamos pelo nome
	   return o1.getNome().compareTo(o2.getNome());
	}
}
