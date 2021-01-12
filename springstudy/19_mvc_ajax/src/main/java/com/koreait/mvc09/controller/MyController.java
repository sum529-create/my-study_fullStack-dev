package com.koreait.mvc09.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
