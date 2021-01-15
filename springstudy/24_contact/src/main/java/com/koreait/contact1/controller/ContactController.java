package com.koreait.contact1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.contact1.command.ContactCommand;
import com.koreait.contact1.command.ContactListCommand;
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
	
	
	// ContactCommand 인터페이스 선언해 둡니다.
	private ContactCommand command;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="contactListPage.do", method=RequestMethod.GET)
	public String list(Model model) {
		// command를 사용하려면 model은 꼭 필요하다.
		command = new ContactListCommand();
		command.execute(model);
		
		return "contact/contactListPage";
	}
	
}
