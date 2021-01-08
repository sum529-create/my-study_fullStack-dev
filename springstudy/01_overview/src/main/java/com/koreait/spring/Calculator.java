package com.koreait.spring;

public class Calculator {
	// field
	
	// constructor
	// 객체를 초기화하기 위해 사용하는 메소드의 타입
	// 값을 구성해서 객체에게 데이터를 제공한다.
	public Calculator() {
		
	
	}
	// method
	public void add(int a, int b) {
		System.out.println(a+"+"+b+"="+(a+b));
	}
	public void subtract(int a, int b) {
		System.out.println(a+"-"+b+"="+(a-b));
	}
	public void multiply(int a, int b) {
		System.out.println(a+"*"+b+"="+(a*b));
	}
	public void divide(int a, int b) {
		System.out.println(a+"/"+b+"="+(a/b));
	}
	
}
