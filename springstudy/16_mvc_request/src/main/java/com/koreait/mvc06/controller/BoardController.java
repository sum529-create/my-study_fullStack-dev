package com.koreait.mvc06.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
	
	// 1. JSP에서 사용하던 방식으로 request를 처리해도 전펴 문제가 없습니다.
	
	@RequestMapping("v01")
	public String goView01(HttpServletRequest request, Model model) {
		// 매개변수
		// 1. HttpServletRequest request : JSP -> Controller로 넘어오는 요청을 처리합니다. (파라미터로 넘어옵니다.)
		// 2. Model model : Controller -> JSP로 넘어가는 결과값을 처리합니다. (model이 request를 사용합니다.)
		
		// 전달 받은 파라미터 처리
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// 결과 View로 데이터 전달
		model.addAttribute("name2", name);
		model.addAttribute("age2", age);
		
		return "view01"; 	// return "/WEB-INF/views/view01.jsp";
		// forward로 view01.jsp로 이동합니다. (기존 request 정보가 넘어갑니다.)
	}
	// 연습
	// http://localhost:9090/board/v02?title=공지사항&hit=1
	
	// view02.jsp
	// 제목 : 공지사항
	// 조회수: 1
	// 작성일 2021-01-11
	@RequestMapping("v02")
	public String goView02(HttpServletRequest request, Model model) {
		model.addAttribute("title", request.getParameter("title"));
		model.addAttribute("hit", Integer.parseInt(request.getParameter("hit")));
		
		model.addAttribute("date", new SimpleDateFormat("yyyy-mm-dd").format(new Date(System.currentTimeMillis())));
		
		return "view02";
	}
	
	// 2. @RequestParam
	// request로 전달되는 파라미터를 처리하는 애너테이션
	
}
