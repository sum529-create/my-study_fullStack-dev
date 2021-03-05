package com.koreait.mybatis2.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor		// 디폴트 생성자
@AllArgsConstructor		// 필드를 위한 생성자
@Data
public class SimpleDto {
	private int no;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
}
