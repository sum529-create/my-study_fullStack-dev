package com.koreait.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
	
	// 우선 연습용
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	// 테이블 사용하는 실전 연습용
	@RequestMapping(value="memberManagePage.do", method=RequestMethod.GET)
	public String memberListPage() {
		return "member/memberManagePage";
	}
	
	
}
