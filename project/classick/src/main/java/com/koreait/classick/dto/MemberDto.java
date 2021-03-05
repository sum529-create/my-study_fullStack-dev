package com.koreait.classick.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	
	private int mNo;
	private String mSno;
	private String mName;
	private String mEmail;
	private String mPw;
	private String mGender;
	private String mPno;
	private String mAddr;
	private String mLastAddr;
	private String mPhone;
	private String mPFilename;
	private String mPayment;
	private String mPoint;
	private String mGrade;
	private Date mRegDate;
}
