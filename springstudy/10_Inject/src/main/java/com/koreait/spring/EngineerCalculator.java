package com.koreait.spring;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;

public class EngineerCalculator {
	// field
	// 자동주입하려면 @Autowired만 작성하면 끝나요.
	// @autowired
	// private Calculator calculator;

	// 수동으로 주입(inject)해 볼께요.
	// 1. Calculator 클래스로 가서 이름을 하나 지어줍니다.
	// 		@Component("이름")
	// 2. EngineerCalculator 클래스로 가서 Bean을 생성해야할 객체 선언부에(private Calculator calculator;)
	//		Calculator 클래스의 "이름"을 알려준다.
	//		@Qualifier("이름")
	// 3. EngineerCalculator 클래스로 가서 Bean을 생성해야할 객체 선언부에(private Calculator calculator;)
	//		직접 Bean을 주입한다.
	//		@Inject
	
	// @Inject 애너테이션을 사용하려면 maven dependency를 추가해야 해요.
	// 외부 라이브러리들은 모두 jar로 제공되는데,
	// maven project는 jar를 모두 자동으로 받아옵니다. (https://mvnrepository.com/)
	// 어떤 jar를 받아와야 하는지는 pom.xml에 작성해 둡니다. (pom.xml에 가 봅니다)
	
	@Qualifier("calculator") 	// calculator라는 이름을 가진 Bean을 찾아서(@Component 보고 찾아요.)
	@Inject				// 주입해 주세요. https://mvnrepository.com/artifact/javax.inject/javax.inject/1
	private Calculator calculator;
	
	// method
	public void add(int a, int b) {
		calculator.add(a, b);
	}
	public void subtract(int a, int b) {
		calculator.subtract(a, b);
	}
	public void multiply(int a, int b) {
		calculator.multiply(a, b);
	}
	public void divide(int a, int b) {
		calculator.divide(a, b);
	}
	public void sqrt(int a) {
		System.out.println(Math.sqrt(a));
	}
}
