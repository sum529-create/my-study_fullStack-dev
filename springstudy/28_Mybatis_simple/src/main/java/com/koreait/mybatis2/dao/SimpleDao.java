package com.koreait.mybatis2.dao;

import java.util.List;

import com.koreait.mybatis2.dto.SimpleDto;

public interface SimpleDao {
	public List<SimpleDto> simpleList();
	
	public int totalCount();
	
	// 삽입 후 성공/실패 결과 추가
	public int simpleInsert(String writer, String title, String content); 
	// int? -> 넘겨서처리하자.
	
	public SimpleDto simpleView(int no);
}
