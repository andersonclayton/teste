import java.util.ArrayList;
import java.util.List;

public class comparaListasTesteMain {

	public static void main(String[] args) {
		List l1 = new ArrayList();
		List l2 = new ArrayList();
		
		l1.add("oi");
		l1.add("olá");
		l1.add("boa tarde");
		
		l2.add("oi");
		l2.add("tudo bem");
		l2.add("olá");
		
		List lt1 = new ArrayList();
		lt1.addAll(l1);
		lt1.removeAll(l2);
		
		List lt2 = new ArrayList();
		lt2.addAll(l2);
		lt2.removeAll(l1);
		
		System.out.println(l1);
		System.out.println(l2);
		System.out.println("lt1: "+lt1);
		System.out.println("lt2 :"+lt2);
		
	}

}
