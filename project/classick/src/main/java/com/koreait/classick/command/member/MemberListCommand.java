package com.koreait.classick.command.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class MemberListCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		model.addAttribute("list", memberDao.list());
	}

}
