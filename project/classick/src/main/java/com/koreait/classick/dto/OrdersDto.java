package com.koreait.classick.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdersDto {
	
	private int oNo;
	private int mNo;
	private int pNo;
	private String oAmount;
	private Date oDate;
	private String oAddr;
	private String oPhone;
	private String oPayment;
	private String oOption;
	private String oNote;

}
