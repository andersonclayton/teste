package data;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConverterDate {

	public static void main(String[] args) {
		// Converte Timestamp para Date
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Date date = new Date(timestamp.getTime());
		System.out.println(date);
		
		//Converte Date para String
		Date dataHoje = new Date();
		SimpleDateFormat formataData = new SimpleDateFormat("dd/MM/yyyy");
		String data = formataData.format(dataHoje);
		System.out.println("Data Formatada em String: "+ data);
		
		//Pega valores da data
		
	}
}
