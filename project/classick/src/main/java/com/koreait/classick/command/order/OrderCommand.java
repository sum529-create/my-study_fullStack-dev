package com.koreait.classick.command.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface OrderCommand {

	public void execute(SqlSession sqlSession, Model model);
	
}
