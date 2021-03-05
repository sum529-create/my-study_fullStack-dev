package com.koreait.classick.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class MemberPwChangeCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String mEmail = request.getParameter("mEmail");
		String mPw = request.getParameter("mPw");
		String ChPw = request.getParameter("ChPw");
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.updatePw(mEmail, mPw, ChPw);
		model.addAttribute("result", result);
	}

}
