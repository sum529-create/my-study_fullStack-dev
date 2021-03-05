package com.koreait.classick.command.admin;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface AdminCommand {
	
	public Map<String, Object> execute(SqlSession sqlSession, Model model);
	
}
