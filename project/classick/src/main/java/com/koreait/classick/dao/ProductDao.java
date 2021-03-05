package com.koreait.classick.dao;

import java.util.List;

import com.koreait.classick.dto.ProductDto;
import com.koreait.classick.dto.ProductArtistDto;

public interface ProductDao {
	
	public List<ProductArtistDto> list(String category, int beginRecord, int endRecord);
	public int totalRecordByCategory(String category);
	public int insert(ProductDto productDto);
	
	public int getPNo(String pName, int aNo);

	public ProductArtistDto view(int pNo);
	
	public int update(ProductDto productDto);
	public int delete(int pNo);

}
