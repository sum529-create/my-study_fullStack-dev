package ex02_set;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/*
 * Iterator 인터페이스
 * 1. 컬렉션을 순회할 때 사용한다.
 * 2. 인터페이스이기 때문에 new로 생성하지못한다.
 * 3. 순회할 컬렉션에 iterator()메소드를 부착해서 생성한다.
 * 4. 인덱스 유무와 상관없이 사용할 수 있다.
 */

public class Ex02_Iterator {

	public static void main(String[] args) {
		
		Set<Integer> set = new HashSet<Integer>();
		
		for(int i = 0; i <5; i++) {
			set.add((int)(Math.random()*10)+1);
		}
		
		// 반복자 Iterator
		Iterator<Integer> itr = set.iterator();	// itr : set에 넣을 수 있는 손이 생겼다.
		
		// 손(itr)에 잡히는 것이 있으면(hasNext() 메소드) 꺼내라. (next() 메소드)
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
		
		// itr은 재활용이 안 된다. 한 번 사용하면 더 이상 사용이 안된다.
		// 다시 순회를 하려면
		// 컬렉션에 재부착 해야 한다.
		itr = set.iterator();	// 재부착
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
	}

}
