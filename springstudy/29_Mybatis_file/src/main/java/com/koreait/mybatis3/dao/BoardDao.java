package com.koreait.mybatis3.dao;

import java.util.List;

import com.koreait.mybatis3.dto.BoardDto;

public interface BoardDao {
	
	public List<BoardDto> boardList();
	// 메소드의 이름이 mapper의 쿼리문 id가 됩니다.
	public void boardInsert(String writer, String title, String content, String fileName);
}
