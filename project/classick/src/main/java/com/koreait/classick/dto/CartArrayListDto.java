package com.koreait.classick.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartArrayListDto {
	
	// Cart Table
	private String cNos;
	private int mNo;
	private int pNo;
	private String sNos;
	private String cAmounts;
	private String cOptions;
	
	// Product Table
	private String pName;
	private String pImage;
	private String pPrice;
	private String pASDesc;
	
	// Artist Table
	private int aNo;
	private String aName;
	
	// Stock Table
	private String stocks;
	private String oAddPrices;
	
}
