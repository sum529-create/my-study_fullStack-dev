package ex;

import org.json.simple.JSONObject;

public class Ex03_JSONString {

	public static void main(String[] args) {
		
		JSONObject obj = new JSONObject();
		
		obj.put("name", "amily");
		obj.put("age", 30);
		obj.put("isAdult", true);
		
		String strJson = obj.toJSONString();
		System.out.println(strJson);
	}

}
