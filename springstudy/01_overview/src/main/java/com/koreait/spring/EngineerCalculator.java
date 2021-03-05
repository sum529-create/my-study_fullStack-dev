package com.koreait.spring;

public class EngineerCalculator {
	// field
	private Calculator calculator;
	private int a;
	private int b;

	// constructor
	public EngineerCalculator(Calculator calculator, int a, int b) {
		super();
		this.calculator = calculator;
		this.a = a;
		this.b = b;
	}
	
	public EngineerCalculator() {
		
	}
	public Calculator getCalculator() {
		return calculator;
	}
	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public int getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	
	// method
	public void add() {
		calculator.add(a, b);
	}
	public void subtract() {
		calculator.subtract(a, b);
	}
	public void multiply() {
		calculator.multiply(a, b);
	}
	public void divide() {
		calculator.divide(a, b);
	}
}
