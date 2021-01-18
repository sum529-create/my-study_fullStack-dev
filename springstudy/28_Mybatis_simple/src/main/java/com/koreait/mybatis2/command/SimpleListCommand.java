package com.koreait.mybatis2.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mybatis2.dao.SimpleDao;
import com.koreait.mybatis2.dto.SimpleDto;

public class SimpleListCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		List<SimpleDto> list = simpleDao.simpleList();
		model.addAttribute("list", list);
		model.addAttribute("totalCount", simpleDao.totalCount()); 
		// list가 몇개인지 불러오면 되기에 size()로 불러온다.  , list.size()); 
		
	}

}
