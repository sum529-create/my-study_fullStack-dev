package ex02_set;

import java.util.*;

public class Ex03_LinkedHashSet {

	public static void main(String[] args) {
		
		// LinkedHashSet 클래스는 저장된 요소들의 순서가 유지된다.
		Set<String> set = new LinkedHashSet<String>();
		
		// 추가 : add() 메소드
		set.add("banana");
		set.add("apple");
		set.add("cherry");
		
		// Iterator 클래스를 이용한 순회
		Iterator<String> itr = set.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}

	}

}
