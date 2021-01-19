package com.spring.mybatis3.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDto {
	private int no;
	private String writer;
	private String title;
	private String content;
	private String filename;
	private Date regDate;
}
