package com.koreait.mvc05.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.mvc05.dto.PersonDto;

@org.springframework.stereotype.Controller
public class Controller {
	
	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
	
	/*
	 *	Model (Controller가 jsp로 보낼 시)
	 *  1. 스프링 2 이전에는 ModelAndView 클래스를 사용했습니다.
	 *  2. 스프링 2 이후에는 Model 클래스를 사용합니다.
	 *  3. Model 클래스는 request의 attribute를 이용하는 클래스입니다.
	 *  
	 *  4. JSP 		HttpServletRequest request;
	 *  			request.setAttribute(속성이름, 값);
	 *  5. Spring	Model model;
	 *  			model.addAttribute(속성이름, 값);
	 *  6. Model 클래스는 Controller에서 View(JSP)로 데이터를 넘길 때 사용합니다.
	 *  7. new Model()을 하지 않고, 매개변수에 선언해서 사용합니다. (마지막 매개변수로 선언해 주면 됩니다.)
	*/
	
	// 1. 단순 변수 넘기기
	@RequestMapping("v01")	
	public String goView01(Model model) {	// 매개변수에 Model을 선언합니다.
		// model에 View(jsp)로 보낼 데이터를 저장합니다.
		model.addAttribute("name", "데이빗");	// 실제로는 request.setAttribute("name", 데이빗")입니다.
		model.addAttribute("age", 30);			// 실제로는 request.setAttribute("age", 60)입니다.
		return "view01";					// return "/WEB-INF/views/view01.jsp";
	}
	
	// 2. Map 넘기기
	@RequestMapping("v02")
	public String goView02(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "앨리스");
		map.put("age", 20);
		// map을 model에 저장합니다.
		model.addAttribute("map", map);
		return "view02";	// return "/WEB-INF/views/view02.jsp";
	}
	
	
	// 3. PersonDto 1개 넘기기
	// com.koreait.mvc05.dto 패키지에 PersonDto 생성(name, age)
	@RequestMapping("v03")
	public String goView03(Model model) {
		PersonDto personDto = new PersonDto();
		personDto.setName("아만다");
		personDto.setAge(25);
		
		model.addAttribute("personDto", personDto);
		
		return "view03";
	}
	
	// 4. PersonDto 2개를 ArrayList에 담아서 넘기기
	
	// @Autowired는 필드, 메소드에 추가할 수 있어요.
	// @Autowired는 지역변수에는 추가할 수 없어요.
	
	// PersonDto p1 = ctx.getBean("person1", PersonDto.class);
	@Autowired		// id가 person1이고, class가 PersonDto인 Bean을 자동으로 만들어 주세요.
	private PersonDto person1;

	// PersonDto p2 = ctx.getBean("person2", PersonDto.class);
	@Autowired		// id가 person2이고, class가 PersonDto인 Bean을 자동으로 만들어 주세요.
	private PersonDto person2;
	
	@RequestMapping("v04")
	public String goView04(Model model) {
		/*AbstractApplicationContext ctx = new GenericXmlApplicationContext("root-context.xml");	// classpath 생략가능 classpath:root-context.xml
		PersonDto p1 = ctx.getBean("person1", PersonDto.class);
		PersonDto p2 = ctx.getBean("person2", PersonDto.class);*/
		ArrayList<PersonDto> list = new ArrayList<PersonDto>();
		list.add(person1);
		list.add(person2);
		model.addAttribute("list", list);
		
		return "view04";	// return "/WEB-INF/views/view04.jsp"
	}
	
}
