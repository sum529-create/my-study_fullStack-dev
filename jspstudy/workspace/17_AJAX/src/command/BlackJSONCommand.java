package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.BlackDao;
import dto.BlackDto;

public class BlackJSONCommand implements BlackCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 동작 확인용
		/*
		 * JSONObject obj = new JSONObject(); // simple-json-1.1.1.jar 
		 * obj.put("name","제시카"); 
		 * obj.put("age", 20); 
		 * obj.put("gender", "여"); 
		 * obj.put("phone", "010-9999-9999"); 
		 * obj.put("address", "속초");
		 * 
		 * return obj.toJSONString();
		 */
		
		List<BlackDto> list = BlackDao.getInstance().list();
		
		// list를 JSON으로 만들기
		
		// JsonObject를 BlackDto로 보면 되기때문에
		// list는 JSONArray로 보면 된다.
		JSONArray jsonArray = new JSONArray();
		
		for(BlackDto blackDto : list) {
			JSONObject obj = new JSONObject();
			// String을 사용해도 됨 ex) String obj = "{"; obj += "name" +blackDto.getName(); {"name":"james"...}
			obj.put("name", blackDto.getName());
			obj.put("age", blackDto.getAge());
			obj.put("gender", blackDto.getGender());
			obj.put("phone", blackDto.getPhone());
			obj.put("address", blackDto.getAddress());
			jsonArray.add(obj);	// JSONArray는 ArrayList처럼 사용한다.
		}
		return jsonArray.toJSONString();
	}

}
