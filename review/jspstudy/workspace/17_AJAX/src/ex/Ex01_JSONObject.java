package ex;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex01_JSONObject {
	
	public static void main(String[] args) {
		String strJSON = "{\"name\": \"emily\", \"age\":20, \"isAdult\":true}";
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		
		try {
			obj = (JSONObject)parser.parse(strJSON);
		}catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(obj.get("name"));
		System.out.println(obj.get("age"));
		System.out.println((boolean) obj.get("isAdult")? "성인":"미성년자");
	}
}
