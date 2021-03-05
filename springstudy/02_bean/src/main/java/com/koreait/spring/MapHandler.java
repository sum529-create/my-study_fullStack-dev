package com.koreait.spring;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MapHandler {

	// field
	private Map<String, String> map = new HashMap<String, String>();
	
	// constructor
	public MapHandler() {
	
	}

	// method 
	public Map<String, String> getMap() {
		return map;
	}
	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	public void mapInfo() {
		// keySet() : key만 빼서 value를 알아내는 방식
		// Set<String> keys = map.keySet();
		// for (String key : keys) {
		// 	System.out.println(key + ": " + map.get(key));
		// }
		// entrySet() : key와 value를 동시에 빼는 방식
		
		// entrySet() 메서드는 key와 value의 값이 모두 필요한 경우 사용하고, 
		// keySet() 메서드는 key의 값만 필요한 경우 사용
		for (Map.Entry<String, String> entry : map.entrySet()) {
			System.out.println(entry.getKey() + ": " + entry.getValue());
		}
	}
	
}