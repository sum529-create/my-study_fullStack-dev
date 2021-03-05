package com.koreait.classick.dao;

import java.util.List;

import com.koreait.classick.dto.StockDto;

public interface StockDao {
	
	public void insert(int pNo, String optionTitle, String optionContent, int optionPrices, int optionStock);
	public List<StockDto> list(int pNo);
	
	
}
