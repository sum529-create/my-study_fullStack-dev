package com.koreait.classick.command.faq;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface FaqCommand {

	public void execute(SqlSession sqlsession, Model model);
	
}
