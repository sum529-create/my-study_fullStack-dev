package com.koreait.classick.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewDto {
	private int rNo;
	private int pNo;
	private int oNo;
	private int mNo;
	private String rTitle;
	private String rContent;
	private String rFilename;
	private int rRating;
	private Date rRegdate;
}
