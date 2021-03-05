package com.koreait.mvc08.dto;

public class PersonDto {
	private String name;
	private String age;
	public PersonDto() {
		// TODO Auto-generated constructor stub
	}
	public PersonDto(String name, String age) {
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
}
