package com.koreait.mybatis2.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis2.command.SimpleCommand;
import com.koreait.mybatis2.command.SimpleInsertCommand;
import com.koreait.mybatis2.command.SimpleListCommand;

@Controller
public class SimpleController {
	
	// field로 SqlSession sqlSession을 만들어 둡니다.
	// root-context.xml을 참고해서 그대로 만들자면
	// SqlSessionTemplate sqlSession; 이것을 생성해야 하지만,
	// SqlSession sqlSession;으로 바꿔서 생성하고 있습니다.
	
	@Autowired
//	private SqlSessionTemplate SqlSession; 얘가 template의 상위 부모 
	private SqlSession sqlSession; 
	SimpleCommand command;
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="simpleInsertPage.do",  method=RequestMethod.GET)
	public String simpleInsertPage() {
		return "simple/simpleInsertPage";
	}
	
	@RequestMapping(value="simpleListPage.do", method=RequestMethod.GET)
	public String simpleListPage(Model model) {
		command = new SimpleListCommand();
		command.execute(sqlSession, model);
		return "simple/simpleListPage";
	}
	
	@RequestMapping(value="simpleInsert.do", method=RequestMethod.POST)
	public String simpleInsert(HttpServletRequest request, 
								RedirectAttributes rttr,	// insertResult 전달용
								Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		command = new SimpleInsertCommand();
		command.execute(sqlSession, model);	// model에 insertResult값이 저장되어 있다.(int)
		
		// model에 저장된 insertResult는 request에 저장되어 있습니다.
		// return "redirect:simpleListPage.do";를 통해서 이동할 때는
		// request가 전달되지 않기 때문에 simpleListPage.do로 이동되는 JSP페이지인
		// simple/simpleListPage.jsp에 insertResult는 전달되지 않습니다.
		
		// add model을 하게 되면 값이 전달이 되지 않는다.
		// 그래서 18_mvc_redirect에서 사용한 RedirectAttributes로 선언하고
		// addFlashAttribute로 받아준다.
		
		// rttr에 저장된 insertResult는 이동할 JSP에 잘 전달됩니다.
		// 페이지로 넘어가는데 rttr은 어떻게 담나? -> request 자동. 담겨있다 생각할것
		// rttr에 저장된 
		// rttr에 저장된 값도 JSP는 EL로 처리하면 됩니다. (${insertResult}, ${afterInsert)
		
		return "redirect:simpleListPage.do"; // 결과페이지 없이 바로 list페이지로 감
	}
	
	
	@RequestMapping(value = "simpleViewPage.do", method=RequestMethod.GET)
	public String simpleView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return "";
	}
	
}
