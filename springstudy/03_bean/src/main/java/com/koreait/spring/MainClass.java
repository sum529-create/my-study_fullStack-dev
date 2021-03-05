package com.koreait.spring;

public class MainClass {

	public static void main(String[] args) {
		Car car = new Car();
		car.setModel("520d");
		car.setPrice(7000);

		Person person = new Person();
		person.setName("제임스");
		person.setMyCar(car);
		
		person.personInfo();

	}

}
