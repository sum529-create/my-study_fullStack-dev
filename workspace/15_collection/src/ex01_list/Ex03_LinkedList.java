package ex01_list;

import java.util.List;
import java.util.LinkedList;

/*
 * LinkedList
 * 1. List 인터페이스를 구현한 클래스이다.
 * 2. 연결리스트를 만들어 놓은 것이다.
 * 3. 각 요소들이 링크를 이용해 연결되어 있다.
 * 4. 장점 : 모든 위치에 추가/삭제가 빠르다.
 * 5. 단점 : 전체 순회가 느리다.
 */

public class Ex03_LinkedList {

	public static void main(String[] args) {
		
		List<String> list = new LinkedList<String>();
		
		list.add("james");
		list.add(new String("amanda"));
		list.add("alice");
		
		if(list.contains("samanda")) {
			System.out.println("samanda가 있다.");
		}else {
			System.out.println("samanda가 없다.");
		}
		
		list.remove(0);		// james 삭제
		list.remove("alice"); // alice 삭제
		
		for(int i =0, size = list.size(); i<size; i++) {
			System.out.println(list.get(i));
		}

	}

}
