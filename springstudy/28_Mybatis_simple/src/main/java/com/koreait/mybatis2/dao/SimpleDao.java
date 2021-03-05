package com.koreait.mybatis2.dao;

import java.util.List;

import com.koreait.mybatis2.dto.SimpleDto;

public interface SimpleDao {
	public List<SimpleDto> simpleList(int beginRecord, int endRecord);
	
	public int totalRecord();
	
	// 삽입 후 성공/실패 결과 추가
	public int simpleInsert(String writer, String title, String content); 
	// int? -> 넘겨서처리하자.
	
	public SimpleDto simpleView(int no);
	
	// 수정 후 성공/실패 결과 추가
	public int simpleUpdate(String title, String content, int no); // 파라미터 순서에 따라 no마지막
	
	public int simpleDelete(int no);
}
