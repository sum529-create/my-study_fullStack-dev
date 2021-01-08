package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:app-context.xml");
		
		EngineerCalculator eCal = ctx.getBean("eCalculator", EngineerCalculator.class);
		
		eCal.add(10, 3);
		eCal.subtract(10, 3);
		eCal.multiply(10, 3);
		eCal.divide(10, 3);
		eCal.sqrt(10);
		ctx.close();
	}
}
