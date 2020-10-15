package ex03_map;

import java.util.HashMap;
import java.util.Map;

/*
 * HashMap 클래스
 * 1. Map 인터페이스를 구현한 클래스이다.
 * 2. 데이터를 쌍(pair)으로 저장하는 클래스이다.
 * 3. 데이터 구성
 * 		1) 키(key) 	 : 중복 저장이 불가능하다.
 * 		2) 값(value) : 중복 저장이 가능하다.
 * 4. 아파트 각 호별 인구수
 * 		101호 : 3명
 * 		102호 : 4명
 * 		103호 : 2명
 * 		...
 * 		key : value
 * 5. 사전
 * 		apple 	: 사과
 * 		banana 	: 바나나
 * 		...
 * 		key 	: value
 */

public class Ex01_HashMap {

	public static void main(String[] args) {
		
		// 영한사전 만들기
		// Map<키, 값>
		// Map<영어단어, 한글의미>
		
		Map<String, String> dict = new HashMap<String, String>();
		
		// 1. 추가 : put(키, 값) 메소드
		dict.put("apple", "사과");
		dict.put("banana", "바나나");
		dict.put("cherry", "체리");
		
		dict.put("apple", "아이폰을 만드는 회사");	// 기존 apple의 값(value)가 수정된다.
		
		// 2. 요소 가져오기 : get(키) 메소드
		System.out.println("apple의 뜻 : " + dict.get("apple"));

		
		// 3. 삭제 : remove(키) 메소드
		dict.remove("cherry");
		
		// 4. 포함여부 확인 : containsKey(키)
		if(dict.containsKey("apple")) {
			dict.remove("apple");
		}
		
		// 5. 크기 : size() 메소드
		System.out.println("dict에 등록된 단어 수 : " + dict.size());
		
		// 순회는 따로
		
	}

}
