package com.koreait.classick.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StockDto {
	
	private int sNo;
	private int pNo;
	private String oTitle;
	private String oContent;
	private int oAddPrice;
	private int stock;

}
