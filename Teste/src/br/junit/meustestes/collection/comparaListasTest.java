package br.junit.meustestes.collection;

import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;
import static org.junit.Assert.*;
import org.junit.Test;

@SuppressWarnings("unused")
public class comparaListasTest {

	@Test
	public void comparaDuasListasDiferentes() {
		List l1 = new ArrayList();
		List l2 = new ArrayList();
		
		l1.add("oi");
		l1.add("olá");
		l1.add("boa tarde");
		
		l2.add("oi");
		l2.add("tudo bem");
		
		List lt = new ArrayList();
		lt.addAll(l1);
		//Adiciona em lt o que tem em l1 e que não tem em l2.
		lt.removeAll(l2);
		
		assertEquals("olá", lt.get(0));
		assertEquals("boa tarde", lt.get(1));
		assertArrayEquals(new String[]{"olá","boa tarde"}, lt.toArray() );
	}

}
