package com.koreait.classick.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TabsDto {
	private String aName;
	private int pNo;
	private String pName;
	private String pImage;
	private String rContent;
	private int rRating;
	private String pCategory;
}
