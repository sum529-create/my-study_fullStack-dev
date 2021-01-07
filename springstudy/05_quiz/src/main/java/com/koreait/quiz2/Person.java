package com.koreait.quiz2;

import java.util.ArrayList;

public class Person {
	
	// field
	private String name;  // 이름
	private double weight; // 몸무게
	private double height; // 키
	private BMICalculator bmiCalculator;  // bmi 계산기(체질량지수)
	private ArrayList<String> hobbies; // 최소 3개의 취미
	
	// constructor
	public Person() {
		
	}
	
	// method
	public void personInfo() {
		System.out.println("성명: " + name);
		System.out.println("키: " + height);
		System.out.println("몸무게: " + weight);
		bmiCalculatorInfo();
		System.out.println("취미: " + hobbies);
	}
	public void bmiCalculatorInfo() {
		bmiCalculator.bmiInfo(weight, height);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public BMICalculator getBmiCalculator() {
		return bmiCalculator;
	}
	public void setBmiCalculator(BMICalculator bmiCalculator) {
		this.bmiCalculator = bmiCalculator;
	}
	public ArrayList<String> getHobbies() {
		return hobbies;
	}
	public void setHobbies(ArrayList<String> hobbies) {
		this.hobbies = hobbies;
	}
}
