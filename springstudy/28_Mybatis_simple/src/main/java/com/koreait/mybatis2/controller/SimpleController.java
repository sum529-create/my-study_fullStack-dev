package com.koreait.mybatis2.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.mybatis2.command.SimpleCommand;
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
	
	@RequestMapping(value="simpleListPage.do", method=RequestMethod.GET)
	public String simpleListPage(Model model) {
		command = new SimpleListCommand();
		command.execute(sqlSession, model);
		return "simple/simpleListPage";
	}
}
