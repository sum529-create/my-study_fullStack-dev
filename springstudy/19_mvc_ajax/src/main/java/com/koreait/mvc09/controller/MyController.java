package com.koreait.mvc09.controller;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
	/* 
		a.jsp <-> controller
		내가 요청한 내용을 다시 그 자리에 보낸다.
		redirect(x) forward (x) 다른 개념
		
		ajax : 페이지를 바꾸지 않고 원하는 결과만 받아오는 것
	 */
		return "index";
	}
	@RequestMapping(value="getText", 
					method=RequestMethod.GET, 
					produces="text/plain; charset=utf-8")	
	// 일반 텍스트 타입 -> return text;에서 text가 "text/plain" 타입입니다.
	@ResponseBody // return하는 데이터는 응답(response)입니다. (뷰나 다른 매핑값이 아니고, 데이터를 반환합니다.)
	public String getText(@RequestParam(value="send") String send) {
		String text = send + "를 받았습니다.";
		
		// ajax는 반환하는(return)값이 "뷰"도 아니고, "다른 매핑값"도 아닙니다.
		// 실제로 데이터(텍스트, json, xml 등)를 반환합니다.
		
		
		return text;	// text는 데이터를 의미합니다. return하는 데이터는 요청한 곳으로 보내는 데이터입니다. -> response
	}
	// response를 사용할 시 @RespponseBody와 produce="text/plain" 작업이 필요하다.
	
	
	@RequestMapping(value="getJson", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	/* MediaType.APPLICATION_JSON_VALUE
	 * => MediaType.APPLICATION_JSON_VALUE == "application/json"
	 * 
	 * produces = "application/json; charset=utf-8"
	 */
	@ResponseBody
	public String getJson(@RequestParam("send")String send) {	// index에서 이 함수 이름 가리키는 거 아님, send -> data
		// json 데이터를 넘겨 주기
		JSONObject obj = new JSONObject();
		obj.put("send", send);
		obj.put("exist", send.isEmpty()? "없음" : "있음");
		
		return obj.toJSONString(); // => String으로 넘기기위해서 toJSONString()을 붙여준다. | success로 넘어간다.
		
		/*
		 * send가 있다면,
		 *   return {"send": "보낸데이터", "exist":"있음"};
		 * send가 없다면,
		 *   return {"send": "", "exist": "없음"};
		 * 
		 * 받는 쪽에서 key값은 send와 exist임
		 * 
		 * return 하는 데이터가 JSON이므로
		 * 1. @ResponseBody가 필요하고, (return하는 것이 뷰나 매핑값이 아니라 "데이터"이다.) (여기서는 JSON데이터)
		 * 2. produces = "application/json; charset=utf-8"이 필요하다.
		 */
	}
}
