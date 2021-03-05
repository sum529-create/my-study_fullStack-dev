package com.koreait.classick.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
	
	private int cNo;
	private int mNo;
	private int pNo;
	private int sNo;
	private int cAmount;
	private String cOption;

}
