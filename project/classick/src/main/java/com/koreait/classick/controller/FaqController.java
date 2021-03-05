package com.koreait.classick.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.classick.command.faq.FaqDeleteCommand;
import com.koreait.classick.command.faq.FaqInsertCommand;
import com.koreait.classick.command.faq.FaqListCommand;
import com.koreait.classick.command.faq.FaqUpdateCommand;
import com.koreait.classick.command.faq.FaqViewCommand;

@Controller
public class FaqController {

	@Autowired
	private SqlSession sqlSession;

	private FaqListCommand faqListCommand;
	private FaqViewCommand faqViewCommand;
	private FaqInsertCommand faqInsertCommand;
	private FaqUpdateCommand faqUpdateCommand;
	private FaqDeleteCommand faqDeleteCommand;
	
	@Autowired
	public void setCommand(FaqListCommand faqListCommand,
						   FaqViewCommand faqViewCommand,
						   FaqInsertCommand faqInsertCommand,
						   FaqUpdateCommand faqUpdateCommand,
						   FaqDeleteCommand faqDeleteCommand) {
		this.faqListCommand = faqListCommand;
		this.faqViewCommand = faqViewCommand;
		this.faqInsertCommand = faqInsertCommand;
		this.faqUpdateCommand = faqUpdateCommand;
		this.faqDeleteCommand = faqDeleteCommand;
	} 
	
	
	@RequestMapping(value="faqListPage.do", method=RequestMethod.GET)
	public String faqListPage(HttpServletRequest request, 
							  Model model) {
		model.addAttribute("request", request);
		faqListCommand.execute(sqlSession, model);
		return "faq/faqListPage";
	}
	
	@RequestMapping(value="faqViewPage.do", method=RequestMethod.GET)
	public String faqViewPage(HttpServletRequest request, 
							  Model model) {
		model.addAttribute("request", request);
		faqViewCommand.execute(sqlSession, model);
		return "faq/faqViewPage";
	}
	
	@RequestMapping(value="faqInsertPage.do", method=RequestMethod.GET)
	public String faqInsertPage() {
		return "faq/faqInsertPage";
	}
	
	@RequestMapping(value="faqInsert.do", method=RequestMethod.GET)
	public String faqInsert(HttpServletRequest request,
							Model model) {
		model.addAttribute("request", request);
		faqInsertCommand.execute(sqlSession, model);
		return "redirect:faqListPage.do";
	}
	
	@RequestMapping(value="faqUpdatePage.do", method=RequestMethod.GET)
	public String faqUpdatePage(HttpServletRequest request,
								Model model) {
		model.addAttribute("request", request);
		faqViewCommand.execute(sqlSession, model);
		return "faq/faqUpdatePage";
	}
	
	@RequestMapping(value="faqUpdate.do", method=RequestMethod.GET)
	public String faqUpdate(HttpServletRequest request, 
							RedirectAttributes rttr,
							Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		faqUpdateCommand.execute(sqlSession, model);
		
		return "redirect:faqViewPage.do?FNo=" + request.getParameter("fNo");
		
		
		
	}
	
	@RequestMapping(value="faqDelete.do", method=RequestMethod.GET)
	public String faqDelete(HttpServletRequest request,
							Model model) {
		model.addAttribute("request", request);
		faqDeleteCommand.execute(sqlSession, model);
		return "redirect:faqListPage.do";
	}
	
}
