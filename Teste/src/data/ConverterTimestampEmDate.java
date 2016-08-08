package data;

import java.sql.Timestamp;
import java.util.Date;

public class ConverterTimestampEmDate {

	public static void main(String[] args) {
		Timestamp stamp = new Timestamp(System.currentTimeMillis());
		Date date = new Date(stamp.getTime());
		System.out.println(date);
	}
}
