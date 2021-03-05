package com.koreait.mybatis3.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface BoardCommand {
	public void execute(SqlSession sqlSession, Model model);
}
