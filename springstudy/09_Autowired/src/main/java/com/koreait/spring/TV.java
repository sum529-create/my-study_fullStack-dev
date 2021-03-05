package com.koreait.spring;

import org.springframework.beans.factory.annotation.Autowired;

public class TV {
	
	// field
	
	/*
	 * @Autowired 자동으로 묶는다.
	 * 이 애너테이션이 붙어 있는 객체 선언부(Speaker speaker;)는 
	 * 해당 Bean(객체)을 자동으로 찾아서 생성을 해 줍니다.
	 * 
	 * xml 이라면 <bean id="speaker" class="Speaker"/>를 자동으로 찾고, 
	 * java라면 public Speaker speaker() {return new Speaker();}(Constructor)를 자동으로 찾습니다.
	 */
	@Autowired
	private Speaker speaker;
	
	// 아래 필드는 @Autowired와 상간이 읍써요.
	private int channel;
	
	// method
	public void channelUp() {
		channel++;
		if(channel > 100) {
			channel = 0;
		}
		System.out.println("현재 채널: " + channel);
	}
	public void channelDown() {
		channel--;
		if(channel < 0) {
			channel = 100;
		}
		System.out.println("현재 채널: " + channel);
	}
	public void volumeUp(int volume) {
		speaker.volumeUp(volume);
	}
	public void volumeDown(int volume) {
		speaker.volumeDown(volume);
	}
	
}
