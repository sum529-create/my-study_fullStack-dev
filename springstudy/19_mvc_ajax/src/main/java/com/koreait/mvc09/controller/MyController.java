package com.koreait.mvc09.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
