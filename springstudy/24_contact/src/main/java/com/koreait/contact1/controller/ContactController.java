package com.koreait.contact1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

import com.koreait.contact1.common.SpringJdbc;

@Controller
public class ContactController {
	
	// field (컨트롤러에서 사용할 template)
	private JdbcTemplate template;
	
	@Autowired				// JdbcTemplate template의 new 작업을 처리한다.
	public void setTemplate(JdbcTemplate template) {
		// @Autowired로 injection된 매개변수 JdbcTemplate template를
		this.template = template;
		// 컨트롤러에세 사용할 수 있도록 넘겨 주고,
		SpringJdbc.template = template;
		// 다른 곳에서도 사용할 수 있도록 넘겨 줍니다.
	}
	
}
