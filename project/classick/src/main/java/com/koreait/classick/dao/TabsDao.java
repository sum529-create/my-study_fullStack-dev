package com.koreait.classick.dao;

import java.util.List;

import com.koreait.classick.dto.TabsDto;

public interface TabsDao {
	public List<TabsDto> ingredients();
	public List<TabsDto> drinks();
	public List<TabsDto> deserts();
	public List<TabsDto> alcohols();
	public List<TabsDto> sideDishs();
	public List<TabsDto> foods();
	public List<TabsDto> recentWorksList();
	
}
