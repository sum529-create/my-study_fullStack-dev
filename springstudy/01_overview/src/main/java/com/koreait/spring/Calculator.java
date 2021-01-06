package com.koreait.spring;

public class Calculator {
	// field
	
	// constructor
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
