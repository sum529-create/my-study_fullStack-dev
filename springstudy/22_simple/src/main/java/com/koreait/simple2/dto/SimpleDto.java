package com.koreait.simple2.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor	// 디폴트 생성자를 자동으로 생성해 줍니다. // insertCommand에서 SimpleDto오류가 사라짐
// 필드가 바뀌면 getter, setter 바꿔야하는 것을 그냥 자동으로 변환해줌
@AllArgsConstructor // 필드를 위한 생성자 (자동으로 매개변수 받아주기)
@Data // lombok의 애너테이션, getter/setter등을 자동으로 생성해 줍니다.
		// Window - Show view - Outline에서 확인이 가능합니다.

public class SimpleDto {

	// field
	private int no;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	
}
