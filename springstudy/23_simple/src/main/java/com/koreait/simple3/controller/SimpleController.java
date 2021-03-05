package com.koreait.simple3.controller;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.simple3.command.SimpleListCommand;
import com.koreait.simple3.config.AppContext;

@Controller
public class SimpleController {
	
	/*
	 *  JAVA(AppContext.java)로 Bean을 만들 때
	 *  1. Controller는 AnotationConfigApplicationContext ctx를 필드로 선언해 둔다.
	 *  2. 모든 command는 ctx.getBean()으로 필요하면 Bean을 가져와서 사용합니다.
	 *  3. com.springsource.net.sf.cglib-2.1.3 라이브러리를 추가해 줍니다.
	 *  	1) tomcat/lib 폴더에 추가할 수 있고,
	 *  	2) 아니면 Maven Dependencies에 추가해서 해당 프로젝트에서만 사용할 수 있습니다.
	*/
	// field
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext.class);
	
	@RequestMapping(value="simpleListPage.do")
	public String simpleListPage(Model model) {
		SimpleListCommand simpleListCommand = (SimpleListCommand)ctx.getBean("listCommand");
		simpleListCommand.execute(model);
		return "simple/simpleListPage";
	}
}
