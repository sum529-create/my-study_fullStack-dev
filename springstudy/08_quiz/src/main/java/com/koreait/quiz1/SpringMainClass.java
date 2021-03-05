package com.koreait.quiz1;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {

	public static void main(String[] args) {
		/*String resourceLocations = "app-context1.xml"; // classpath: 생략가능
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext(resourceLocations);*/
		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext1.class); 
		Soldier soldier1 = ctx.getBean("soldier1", Soldier.class);
		// Soldier soldier1 = (Soldier)ctx.getBean("soldier");	// 이렇게 해도 됩니다.
		Soldier soldier2 = ctx.getBean("soldier2", Soldier.class);
		soldier1.infoSolier();
		System.out.println();
		soldier2.infoSolier();
		ctx.close();
	}

}
