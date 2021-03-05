package com.koreait.classick.command.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface CartCommand {

	public String execute(SqlSession sqlSession, Model model);

}
