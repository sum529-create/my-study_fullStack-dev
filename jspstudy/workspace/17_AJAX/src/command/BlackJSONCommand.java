package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class BlackJSONCommand implements BlackCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		JSONObject obj = new JSONObject();	// simple-json-1.1.1.jar
		obj.put("name", "제시카");
		obj.put("age", 20);
		obj.put("gender", "여");
		obj.put("phone", "010-9999-9999");
		obj.put("address", "속초");
		
		return obj.toJSONString();
	}

}
