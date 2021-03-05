package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:app-context.xml");
		/*
		 * <bean id="tv" class="com.koreait.spring.TV"/>
		 * 아래 코드는 위의 Bean을 생성합니다.
		 *  
		 */
		TV tv = ctx.getBean("tv", TV.class);
		tv.channelUp();
		tv.channelDown();
		tv.volumeUp(5);
		tv.volumeDown(5);
		
		ctx.close();
	}
}
