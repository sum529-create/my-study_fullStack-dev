package com.koreait.classick.command.tabs;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface TabsCommand {
	
	public void execute(SqlSession sqlSession, Model model);
	
}
