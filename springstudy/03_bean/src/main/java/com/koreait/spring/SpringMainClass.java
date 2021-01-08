package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {

	public static void main(String[] args) {
		String resourceLocation1 = "classpath:app-context1.xml";
		String resourceLocation2 = "classpath:app-context2.xml";
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(resourceLocation1, resourceLocation2);
		
		Person p = ctx.getBean("person", Person.class);
		p.personInfo();
		
		ctx.close();

	}

}
