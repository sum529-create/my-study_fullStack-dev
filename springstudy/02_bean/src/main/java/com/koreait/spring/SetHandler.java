package com.koreait.spring;

import java.util.Iterator;
import java.util.Set;

public class SetHandler {
	
	// field
	private Set<String> set;
	
	// constructor
	public SetHandler() {
		
	}
	
	// method
	public Set<String> getSet(){
		return set;
	}
	public void setSet(Set<String> set) {
		this.set = set;
	}
	public void setInfo() {
		// Set 순회1
		for(String item:set) {
			System.out.println(item);
			
		}
		// Set 순회2
		// Iterator = 자바의 컬렉션 프레임워크에서 컬렉션에 저장되어 있는 요소들을 읽어오는 방법을 표준화한 것
		// '프레임워크'는 목적에 따라 효율적으로 구조를 짜놓는 개발 방식 ex) DIY만들기, 떡볶이 키트
		Iterator<String> itr = set.iterator();
		while (itr.hasNext()) {
			System.out.println(itr.next()); 	// 가져올것 : next()
		}
	}
}
