package String;

public class localizaNaString {

	public static void main(String[] args) {
		  String valor = "br.ufrn.sigrh.timer.ExportaLocalizacaoTimer";
          
          System.out.println(valor.endsWith("ExportaLocalizacaoTimer"));
          System.out.println(valor.startsWith("br.ufrn"));
          System.out.println(valor.startsWith("ufrn", 3));

	}

}
