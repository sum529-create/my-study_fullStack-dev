package com.koreait.mvc05.dto;

public class PersonDto {
	
	// field
	private String name;
	private int age;
	
	// constructor
	public PersonDto() {
		// TODO Auto-generated constructor stub
	}

	public PersonDto(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	
	
}
