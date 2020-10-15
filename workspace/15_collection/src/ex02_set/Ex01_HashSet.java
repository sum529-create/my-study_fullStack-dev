package ex02_set;

import java.util.HashSet;
import java.util.Set;

/*
 * HashSet 클래스
 * 1. Set 인터페이스를 구현한 클래스이다.
 * 2. Set 인터페이스의 특징
 * 		1) 저장된 요소 간 순서가 없다.
 * 		2) 중복 저장이 불가하다.
 * 3. HashSet 클래스 중복 판단 원리
 * 		1) hashCode() 비교
 * 			(1) 값이 같으면 중복 가능성 있음	(equals() 호출)
 * 			(2) 값이 다르면 중복 가능성 없음
 * 		2) equals() 동등 비교
 */

public class Ex01_HashSet {

	public static void main(String[] args) {

		Set<String> set = new HashSet<String>();
		
		// 1. 추가 : add() 메소드
		set.add("java");
		set.add("db");
		set.add("html");
		set.add("css");
		set.add("javascript");
		set.add("jsp");
		set.add("java");	// 중복
		set.add("css");		// 중복
				
		// 2. 순회
		for(String course : set) {
			System.out.println(course); 	// 중복이 없어지고, 출력순서가 없어졌다.
		}

	}

}
