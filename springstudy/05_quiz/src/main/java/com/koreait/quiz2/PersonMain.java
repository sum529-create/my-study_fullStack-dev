
package com.koreait.quiz2;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PersonMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:app-context2.xml");
		Person p = ctx.getBean("person", Person.class);
		p.personInfo();
		ctx.close();

	}

}