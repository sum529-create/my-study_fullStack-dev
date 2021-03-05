package com.koreait.classick.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartListDto {
	
	// Cart Table
	private int cNo;
	private int mNo;
	private int pNo;
	private int sNo;
	private int cAmount;
	private String cOption;
	
	// Product Table
	private String pName;
	private String pImage;
	private String pPrice;
	private String pASDesc;
	
	// Artist Table
	private int aNo;
	private String aName;
	
	// Stock Table
	private int stock;
	private int oAddPrice;
	
}
