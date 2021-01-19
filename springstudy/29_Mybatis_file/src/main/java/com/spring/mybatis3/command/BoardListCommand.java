package com.spring.mybatis3.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.spring.mybatis3.dao.BoardDao;

public class BoardListCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		model.addAttribute("list", boardDao.boardList());

	}

}
