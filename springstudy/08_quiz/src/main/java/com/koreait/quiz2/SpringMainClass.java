package com.koreait.quiz2;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {

	public static void main(String[] args) {
		String resourceLocations = "classpath:app-context2.xml";
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext(resourceLocations);
		AbstractApplicationContext ctx2 = new AnnotationConfigApplicationContext(AppContext2.class); 
		Car car1 = ctx1.getBean("car1", Car.class);
		Car car2 = ctx2.getBean("car2", Car.class);
		car1.infoCar();
		System.out.println();
		car2.infoCar();
		ctx1.close();
		ctx2.close();

	}

}
