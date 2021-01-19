package com.spring.mybatis3.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mybatis3.command.BoardListCommand;

@Controller
public class BoardController {
	
	
	SqlSession sqlSession;
	
	private BoardListCommand boardListCommand;
	
	// root-context.xml
	@Autowired								// 여기서 Autowired하고 위 필드로 보내준다.
	public void setCommand(BoardListCommand boardListCommand) {
		this.boardListCommand = boardListCommand;
	}
	
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="boardListPage.do", method=RequestMethod.GET)
	public String boardListPage(Model model) {
		boardListCommand.execute(sqlSession, model);
		return "board/boardListPage";
	}
}
