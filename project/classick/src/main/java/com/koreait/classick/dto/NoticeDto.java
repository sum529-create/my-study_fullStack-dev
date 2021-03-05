package com.koreait.classick.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {
	
	private int nNo;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private String nFilename;
	private Date nRegDate;

}
