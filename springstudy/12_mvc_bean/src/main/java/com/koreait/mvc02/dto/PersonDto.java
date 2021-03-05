package com.koreait.mvc02.dto;

public class PersonDto {
	
	// field
	private String name;
	private int age;
	private ContactDto contact;
	
	// constructor
	public PersonDto() {
		// TODO Auto-generated constructor stub
	}

	public PersonDto(String name, int age, ContactDto contact) {
		super();
		this.name = name;
		this.age = age;
		this.contact = contact;
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

	public ContactDto getContact() {
		return contact;
	}

	public void setContact(ContactDto contact) {
		this.contact = contact;
	}
	
	
	
}
