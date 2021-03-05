package com.koreait.classick.command.tabs;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.TabsDao;
import com.koreait.classick.dto.TabsDto;

public class PopularWorksCommand implements TabsCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		TabsDao tabsDao = sqlSession.getMapper(TabsDao.class);
		List<TabsDto> foods = tabsDao.foods();
		List<TabsDto> deserts = tabsDao.deserts();
		List<TabsDto> ingredients = tabsDao.ingredients();
		List<TabsDto> alcohols = tabsDao.alcohols();
		List<TabsDto> sideDishs = tabsDao.sideDishs();
		List<TabsDto> drinks = tabsDao.drinks();
		List<List<TabsDto>> list = new ArrayList<List<TabsDto>>();
		list.add(foods);
		list.add(deserts);
		list.add(drinks);
		list.add(sideDishs);
		list.add(ingredients);
		list.add(alcohols);
		model.addAttribute("list", list);
	}
}
