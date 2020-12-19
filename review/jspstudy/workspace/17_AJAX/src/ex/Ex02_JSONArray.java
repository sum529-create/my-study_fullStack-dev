package ex;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex02_JSONArray {

	public static void main(String[] args) {
		
		// 예제로 사용할 JSON 배열
		// [{},{}]
		// [{"name": "emily", "age":20, "isAdult":true}, {"name": "emily", "age":20, "isAdult":true]

		String strJSON = "[{\"name\": \"emily\", \"age\":20, \"isAdult\":true}, {\"name\": \"emily\", \"age\":20, \"isAdult\":true}]";
		
		// 1. JSON Parser 생성
		JSONParser parser = new JSONParser();
		
		// 2. JSON Array 준비
		JSONArray list = null;
		
		// 3. parsing
		try {
			list = (JSONArray)parser.parse(strJSON);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		// JSONArray는 Java의 ArrayList와 사용법이 같다.
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		
		
		
	}

}
