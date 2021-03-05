package com.koreait.classick.dao;

import java.util.List;
import java.util.Map;

import com.koreait.classick.dto.ArtistDto;

public interface ArtistDao {
	// 판매자 번호 가져오기
	public int getANo(int mNo);
	
	public int totalRecordA();
	public List<Map<String, Object>> artistList(int beginRecord, int endRecord);
	public Map<String, Object> artistHomeInfo(int aNo);
	public List<String> artistHomeProductList(int aNo);
	public List<Map<String, Object>> artistProductList(int rownum);
	public int artistRating(int rowNum);
	public Map<String, Object> artistHasProduct(int rowNum);
	public List<ArtistDto> searchList(String p);
	public List<Map<String,Object>> artistReviewList(int aNo);
	public int countArtistProduct(int aNo);
	public int countReviewList(int aNo);
}
