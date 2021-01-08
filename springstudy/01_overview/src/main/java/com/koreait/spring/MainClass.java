package com.koreait.spring;

public class MainClass {
	
	public static void main(String[] args) {
		
		// 개발자가 직접 new를 이용해서 각종 객체(인스턴스, 빈)을 생성한다.
		
		Calculator calculator1 = new Calculator();
		Calculator calculator2 = new Calculator();
		
		
		// EngineerCalculator 사용방법
		// 1. 디폴트 생성자 + setter
		// 2. 필드를 이용한 생성자
		
		
		// 1. 디폴트 생성자 + setter
		// 1) 디폴트 생성
		EngineerCalculator eCalculator1 = new EngineerCalculator();
		
		// 2) setter
		eCalculator1.setA(10);
		eCalculator1.setB(3);
		eCalculator1.setCalculator(calculator1);
		
		eCalculator1.add();
		eCalculator1.subtract();
		eCalculator1.multiply();
		eCalculator1.divide();
		
		// 2. 필드를 이용한 생성자
		EngineerCalculator eCalculator2 = new EngineerCalculator(calculator2, 100, 30);
		
		eCalculator2.add();
		eCalculator2.subtract();
		eCalculator2.multiply();
		eCalculator2.divide();
	}
}
