package com.koreait.classick.dao;

import java.util.List;

import com.koreait.classick.dto.NoticeDto;

public interface NoticeDao {
	
	public List<NoticeDto> list(int beginRecord, int endRecord);
	public int totalRecord();
	public NoticeDto view(int nNo);
	public int insert(String title, String content, String writer, String filename);
	public int updateAll(String title, String content, String filename, int nNo);
	public int update(String title, String content, int nNo);
	public int delete(int nNo);

}
