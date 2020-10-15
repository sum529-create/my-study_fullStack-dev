package ex03_map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Ex02_HashMap {

	public static void main(String[] args) {
		
		// 어떤 사람의 정보(이름, 나이, 키, 성별)를 Map으로 생성
		Map<String, String> person = new HashMap<String, String>();
		person.put("name", "alice");
		person.put("age", 20 + "");
		person.put("height", 175.5 + "");
		person.put("gender", "여");
		
		// 순회1. keySet() 메소드
		// 1. key만 뺀다.
		// 2. key들은 Set에 저장해야만 한다.
		// 3. get() 메소드에 Set에서 뺀 key를 전달하면 value가 나온다.
		
		// 1) Iterator
		Set<String> set = person.keySet();	// set = ["name", "age", "height", "gender"]
		Iterator<String> itr = set.iterator();
		while(itr.hasNext()) {
			String key = itr.next();		// itr.next() == key : "name" -> "age" -> "height" -> "gender"
			String value = person .get(key);	// person.get("name") == "alice"
			System.out.println(key + ": " + value);
		}
		
		// 2) 향상 for
		for(String key : person.keySet()) {
			String value = person.get(key);
			System.out.println(key + ": " + value);
		}
		
		
		// 순회2.entrySet() 메소드
		// entry : key와 value를 묶어서 부르는 말(person은 entry가 4개 있다.)
		// key : getKey() 메소드
		// value : getValue() 메소드
		
		// 1) 향상 for문
		for(Map.Entry<String, String> entry : person.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			System.out.println(key + ": " + value);
		}
		
		// 2) Iterator
		Set<Map.Entry<String, String>> set2 = person.entrySet();
		Iterator<Map.Entry<String, String>> itr2 = set2.iterator();
		while(itr2.hasNext()) {
			Map.Entry<String, String> entry = (Map.Entry<String, String>) itr2.next();
			String key = entry.getKey();
			String value = entry.getValue();
			System.out.println(key + ": " + value);
		}
		

	}

}
