package com.koreait.mybatis1.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor		// 디폴트 생성자
@AllArgsConstructor		// 필드를 위한 생성자
@Data
public class UsersDto {
	private int no;
	private String name;
	private String phone;
}
