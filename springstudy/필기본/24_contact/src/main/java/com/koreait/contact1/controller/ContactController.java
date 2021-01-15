package com.koreait.contact1.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.contact1.command.ContactCommand;
import com.koreait.contact1.command.ContactInsertCommand;
import com.koreait.contact1.command.ContactListCommand;
import com.koreait.contact1.common.SpringJdbc;

@Controller
public class ContactController {
	
	// field (컨트롤러에서 사용할 template)
	// private JdbcTemplate template;
	
	
	@Autowired				// JdbcTemplate template의 new 작업을 처리한다.
	public void setTemplate(JdbcTemplate template) {
		// @Autowired로 injection된 매개변수 JdbcTemplate template를
		// this.template = template;
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
	
	@RequestMapping(value = "contactInsertPage.do", method=RequestMethod.GET)
	public String insertPage() {
		return "contact/ContactInsertPage";
	}
	
	// 전달해야 할 값이 5개 있다. request값으로 전달받아야한다.
	@RequestMapping(value="contactInsert.do", method=RequestMethod.POST)
	public String insert(HttpServletRequest request, Model model) {
		// request: contactInsertPage.jsp에서 전달된 5개 파라미터 (name, phone..)
		// model : ContactInsertCommand에 전달하는 파라미터
		model.addAttribute("request", request);
		command = new ContactInsertCommand();
		command.execute(model);
		return "redirect:contactListPage.do";	// redirect로 보낼거기 때문
	}
	
}
