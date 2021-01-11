package com.koreait.mvc06.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	// http://localhost:9090/mvc06/board/v02?title=공지사항&hit=1
	
	// view02.jsp
	// 제목 : 공지사항
	// 조회수: 1
	// 작성일 2021-01-11
	@RequestMapping("v02")
	public String goView02(HttpServletRequest request, Model model) {
		model.addAttribute("title", request.getParameter("title"));
		model.addAttribute("hit", Integer.parseInt(request.getParameter("hit")));
		
		model.addAttribute("date", new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())));
		
		return "view02";	// return "/WEB-INF/views/view02.jsp";
	}
	
	// 2. @RequestParam
	// request로 전달되는 파라미터를 처리하는 애너테이션
	@RequestMapping("v03")
	public String goView03(@RequestParam("name") String name,
							@RequestParam("age") int age,
							Model model) {
		// @RequestParam("name") String name : 파라미터 name을 String name에 저장하세요.
		// @RequestParam("age") int age : 파라미터 age를 int age에 저장하세요.
		
		// moodel에 속성으로 저장합니다.
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "view03";	// return "/WEB-INF/views/view03.jsp";
	}
	
	// 연습
	// http://localhost:9090/mvc06/board/v04?title=공지사항&hit=1
		
	// view04.jsp
	// 제목 : 공지사항
	// 조회수: 1
	// 작성일 2021-01-11
	@RequestMapping("v04")
	public String goView04(@RequestParam("title") String title,
							@RequestParam("hit") int hit,
							Model model) {
		// @RequestParam("name") String name : 파라미터 name을 String name에 저장하세요.
		// @RequestParam("age") int age : 파라미터 age를 int age에 저장하세요.
		
		// moodel에 속성으로 저장합니다.
		model.addAttribute("title", title);
		model.addAttribute("hit", hit);
		model.addAttribute("date", new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())));
		
		return "view04";	// return "/WEB-INF/views/view04.jsp";
	}
}
