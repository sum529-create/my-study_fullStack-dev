package com.koreait.classick.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FaqDto {

	private int fNo;
	private String fTitle;
	private String fContent;
	private String fWriter;
	private Date fRegDate;
	
	
}
