package com.koreait.mvc04.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
public class Controller {
	
	/*
	 * ModelAndView 클래스
	 * 1. 스프링 2 이전에 사용하던 클래스로 (아마도) 현재 많이 생산되어 있는 코드이다.
	 * 2. 앞으로 새로 만드는 프로젝트에서는 사용을 지양하는 것이 좋습니다.
	 * 		(구글링하다가 ModelAndView가 보이면 뒤로 나오셔도 됩니다.)
	 * 3. Model과 View를 모두 처리하는 클래스입니다.
	 * 4. Model은 request라고 생각하시면 편합니다.
	 * 		- Model은 Controller가 JSP에게 전달하고자 하는 데이터를 속성(attribute)으로 저장하는 클래스이다.
	 * 		- attribute를 추가하는 메소드: addObject()
	 * 5. View는 JSP를 의미합니다.
	 * 		- view name을 추가하는 메소드: setViewName()
	*/
	
	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
	
	// ModelAndView 사용하기
	
	// 1. 단순 이동
	@RequestMapping("v01")	// Mapping과 이동경로가 달라도 상관이 전혀 없습니다.
	public ModelAndView goView01() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view01");		// view의 이름을 정해준다. /WEB-INF/views/view01.jsp로 이동됩니다.
		return mav;
	}
	
	// 지금까지 JSP로 이동하는 방식은
	// 100% forward 였습니다. redirect하는 방법은 나중에 다루게 됩니다.
	
	// forward이기 때문에 JSP로 데이터를 보낼 수 있습니다.
	@RequestMapping("v02")
	public ModelAndView goView02() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view02"); 		// return "/WEB-INF/views/view02.jsp"
		// view02.jsp로 보낼 데이터를 저장해 봅니다.
		mav.addObject("name", "에밀리");
		mav.addObject("age", 20);
		return mav;
	}

}
