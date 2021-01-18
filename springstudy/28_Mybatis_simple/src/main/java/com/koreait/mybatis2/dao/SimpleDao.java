package com.koreait.mybatis2.dao;

import java.util.List;

import com.koreait.mybatis2.dto.SimpleDto;

public interface SimpleDao {
	public List<SimpleDto> simpleList();
	
	public int totalCount();
	
}
