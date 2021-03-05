package com.koreait.classick.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class EmailCheckListCommand implements EmailCommand {

		@Override
		public Map<String, Object> execute(SqlSession sqlSession, Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String mEmail = request.getParameter("mEmail");
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("mailInfo", memberDao.memberEmailListCheck(mEmail));
		
		return map1;
	
		}

}
