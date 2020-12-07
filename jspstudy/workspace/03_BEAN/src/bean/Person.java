package bean;

/*
 * 자바 빈 (bean) 
 * 1. 자바 빈 개발 규약에 의한 자바 클래스이다.
 * 2. 개발 규약
 * 		1) 반드시 특정 패키지에 저장해야 한다.
 * 		2) 디폴트 생성자가 필요하다. (생성자를 하나도 안 만들면 디폴트가 사용되므로 안 만들어도 된다.)
 * 		3) getter/setter를 추가해야 한다.
 */

public class Person {
	// field
	private String name;
	private int age;
	private char gender;
	
	// default constructor
	// constructor 아무 일도 안하는 생성자 안써도 무방 써도 무방
	// Person() {}
	
	// method (getter/setter)

	
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
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	
}
