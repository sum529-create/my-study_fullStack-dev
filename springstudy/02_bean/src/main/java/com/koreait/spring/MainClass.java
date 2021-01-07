package com.koreait.spring;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MainClass {
	public static void main(String[] args) {
		ListHandler listHandler = new ListHandler();
		
		List<String> foods = new ArrayList<String>();
		foods.add("떡볶이");
		foods.add("김밥");
		foods.add("순대");
		foods.add("튀김");
		foods.add("어묵");
		
		listHandler.setList(foods);
		listHandler.listInfo();
		System.out.println(listHandler.getList());
		
		SetHandler setHandler = new SetHandler();
		
		Set<String> courses = new HashSet<String>();
		courses.add("자바");
		courses.add("자바");
		courses.add("파이썬");
		courses.add("파이썬");
		courses.add("스프링");
		courses.add("스프링");
		
		setHandler.setSet(courses);
		setHandler.setInfo();
		
	}
}
