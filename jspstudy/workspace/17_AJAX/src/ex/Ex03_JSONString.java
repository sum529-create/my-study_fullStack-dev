package ex;

import org.json.simple.JSONObject;

public class Ex03_JSONString {

	public static void main(String[] args) {
		
		// 1. JSON데이터  만들기
		
		JSONObject obj = new JSONObject();
		
		// Map 처럼 데이터를 저장할 수 있다.
		obj.put("name", "amanda");
		obj.put("age", 22);
		obj.put("isAdult", true);
		
		
		// 2. JSON 데이터를 String으로 변환하기
		String strJSON = obj.toJSONString();
		System.out.println(strJSON);
	}

}
