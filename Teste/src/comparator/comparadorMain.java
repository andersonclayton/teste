package comparator;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class comparadorMain {
	
	public static void main(String[] args) {
		
		Pessoa p1 = new Pessoa("Curitiba", "Analista de Sistemas", "Vinicius");
		Pessoa p2 = new Pessoa("Curitiba", "Engenheiro Civil", "Marcio");
		Pessoa p3 = new Pessoa("Anápolis", "Zootecnico", "Pedro");
		Pessoa p4 = new Pessoa("Curitiba", "Veterinário", "Marcelo");
		Pessoa p5 = new Pessoa("Curitiba", "Engenheiro Civil", "Andreia");
		Pessoa p6 = new Pessoa("Anápolis", "Botânico", "Laura");
		
		List<Pessoa> pessoas = new ArrayList<Pessoa>();
		pessoas = Arrays.asList(p1,p2,p3,p4,p5,p6);
		System.out.println(pessoas);
		
		ComparadorPorCidadeEProfissao comparador = new ComparadorPorCidadeEProfissao();
		Collections.sort(pessoas, comparador);
		
		System.out.println(pessoas);
	}
//Fonte: http://www.guj.com.br/t/ordenar-list-com-varios-atributos/130182/8	
}
