package ex;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Ex02_JSONArray {

	public static void main(String[] args) {
		
		String strJSON = "[{\"name\": \"emily\", \"age\":20, \"isAdult\":true}, {\"name\": \"emily\", \"age\":20, \"isAdult\":true}]";
		JSONParser parser = new JSONParser();
		JSONArray list = null;
		
		try {
			list = (JSONArray)parser.parse(strJSON);
		}catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		
		
		
	}

}
