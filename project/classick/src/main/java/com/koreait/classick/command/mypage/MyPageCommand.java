package com.koreait.classick.command.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MyPageCommand {
	
	public void execute(SqlSession sqlSession, Model model);
	
}
