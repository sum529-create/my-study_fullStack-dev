package com.koreait.contact1.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor		// 디폴트 생성자
@AllArgsConstructor		// 필드를 위한 생성자
@Data			// lombok의 애너테이션, getter/setter등을 자동으로 생성
public class ContactDto {
	
	private int no;
	private String name;
	private String phone;
	private String address;
	private String email;
	private String note;
	
	
	
}
