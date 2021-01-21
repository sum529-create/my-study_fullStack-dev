package com.koreait.rest.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.rest.dao.MemberDao;
import com.koreait.rest.dto.MemberDto;

public class MemberUpdateCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		resultMap.put("result", memberDao.memberUpdate(memberDto));
		
		return resultMap;
	}

}
