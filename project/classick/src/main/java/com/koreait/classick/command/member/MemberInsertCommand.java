package com.koreait.classick.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;
import com.koreait.classick.dao.RoleDao;

public class MemberInsertCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String mName = request.getParameter("mName");
		String mEmail = request.getParameter("mEmail");
		String mPw = request.getParameter("mPw");
		String mPhone = request.getParameter("mPhone");
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		RoleDao roleDao = sqlSession.getMapper(RoleDao.class);
		
		int insertResult = memberDao.memberInsert(mName, mEmail, mPw, mPhone);
		roleDao.roleInsert(mEmail);
		if(insertResult > 0) {
			model.addAttribute("insertResult", insertResult);
		}
	}

}
