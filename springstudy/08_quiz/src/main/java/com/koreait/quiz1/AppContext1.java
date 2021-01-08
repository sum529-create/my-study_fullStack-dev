package com.koreait.quiz1;

import java.util.HashMap;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@ImportResource("classpath:app-context1.xml")
@Configuration
public class AppContext1 {
	@Bean
	public Gun gun2() {
		return new Gun("k1", 10);
	}
	@Bean
	public Soldier soldier2() {
		HashMap<String, String> infoSoldier2 = new HashMap<String, String>();
		infoSoldier2.put("부대명: ", "1사단");
		infoSoldier2.put("부대위치", "산속");
		return new Soldier("김상사", infoSoldier2, gun2());
	}
	
}
