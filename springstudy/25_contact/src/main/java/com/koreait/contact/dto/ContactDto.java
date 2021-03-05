package com.koreait.contact.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ContactDto {
	private int no;
	private String name;
	private String phone;
	private String address;
	private String email;
	private String note;
	
}
