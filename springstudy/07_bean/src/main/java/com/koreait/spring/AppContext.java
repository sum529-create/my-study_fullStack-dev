package com.koreait.spring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Bean;

/*
 * app-context.xml에 정의된 Bean을
 * AppContext.java로 가져올 수 있어요.
 * 
 * 방법
 * 1. AppContext 클래스에 @ImportResource 애너테이션을 추가한다.
 */

@ImportResource("classpath:app-context.xml")
@Configuration
public class AppContext {
	@Bean
	public Student student2() {
		ArrayList<Integer> scores = new ArrayList<Integer>();
		scores.add(80);
		scores.add(85);
		scores.add(90);
		HashSet<String> volunteers = new HashSet<String>();
		volunteers.add("병원");
		volunteers.add("양로원");
		volunteers.add("고아원");
		HashMap<String, String> homeInfo = new HashMap<String, String>();
		homeInfo.put("phone", "032-543-2100");
		homeInfo.put("address", "인천시 부평구");
		return new Student("데이빗", scores, volunteers, homeInfo);
	}
}
