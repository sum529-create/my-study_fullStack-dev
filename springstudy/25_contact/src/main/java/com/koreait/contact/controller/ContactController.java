package com.koreait.contact.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.contact.command.ContactCommand;
import com.koreait.contact.command.ContactInsertCommand;
import com.koreait.contact.command.ContactListCommand;
import com.koreait.contact.command.ContactViewCommand;
import com.koreait.contact.common.SpringJdbc;

@Controller
public class ContactController {
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		SpringJdbc.template = template;
	}
	
	private ContactCommand command;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="contactListPage.do", method=RequestMethod.GET)
	public String list(Model model) {
		command = new ContactListCommand();
		command.execute(model);
		return "contact/contactListPage";
	}
	
	@RequestMapping(value="contactInsertPage.do", method=RequestMethod.GET)
	public String insertPage() {
		return "contact/contactInsertPage";
	}
	
	@RequestMapping(value="contactInsert.do", method=RequestMethod.POST)
	public String insert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new ContactInsertCommand();
		command.execute(model);
		return "redirect:contactListPage.do";
	}
	
	@RequestMapping(value="contactViewPage.do", method=RequestMethod.GET)
	public String viewPage(HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		command = new ContactViewCommand();
		command.execute(model);
		return "contact/contactViewPage";
	}
}
