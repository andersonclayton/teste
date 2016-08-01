
public class DiscoveryOperationalSystem {

	public static void main(String[] args) {
//		System.out.println(System.getProperties());
//		System.out.println(System.getProperty("os.name"));
//		System.getProperties().list(System.out);
		if(System.getProperty("os.name").contentEquals("%linux%")){
			System.out.println("É linux");
		}
	}

}
