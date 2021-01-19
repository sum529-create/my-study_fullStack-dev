package com.koreait.mybatis3.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.mybatis3.command.BoardListCommand;

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
	
	
	@RequestMapping(value="boardInsertPage.do", method=RequestMethod.GET)
	public String boardInsertPage() {
		return "board/boardInsertPage";
	}
	
	@RequestMapping(value="boardListPage.do", method=RequestMethod.GET)
	public String boardListPage(Model model) {
		boardListCommand.execute(sqlSession, model);
		return "board/boardListPage";
	}
	
	@RequestMapping(value="boardInsert.do", method=RequestMethod.POST)
	public String boardInsert(MultipartHttpServletRequest multipartRequest,
								Model model) {
		// 첨부가 없을 때 파라미터 : HttpServletRequest request
		// 첨부가 있을 때 파라미터 : 
		// jsp에선 multipartRequest를 사용하기위해 cos.jar를 사용했지만
		// 현재는 jar가 content-io와 fileupload를 사용했다.
		// 조금 다르다.
		model.addAttribute("multipartRequest", multipartRequest);
		return "";
	}
}
