package com.koreait.classick.command.tabs;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.TabsDao;
import com.koreait.classick.dto.TabsDto;

public class RecentWorksCommand implements TabsCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		TabsDao tabsDao = sqlSession.getMapper(TabsDao.class);
		List<TabsDto> list = tabsDao.recentWorksList();
		model.addAttribute("list", list);
	}

}
