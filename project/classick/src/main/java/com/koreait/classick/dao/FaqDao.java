package com.koreait.classick.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.koreait.classick.dto.FaqDto;

import lombok.experimental.PackagePrivate;

public interface FaqDao {

	public int totalRecord();

	public List<FaqDto> faqList(@Param("beginRecord") int beginRecord, @Param("endRecord") int endRecord);
	
	public FaqDto faqView(int no);
	
	public int faqInsert(@Param("fTitle") String fTitle, @Param("fContent") String fContent, @Param("fWriter") String fWriter);
	
	public int faqUpdate(String fTitle, String fContent, int no);
	
	public int faqDelete(int FNo);
	
}
