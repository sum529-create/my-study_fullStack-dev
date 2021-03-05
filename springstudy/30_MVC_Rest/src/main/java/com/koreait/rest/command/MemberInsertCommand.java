package com.koreait.rest.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.rest.dao.MemberDao;
import com.koreait.rest.dto.MemberDto;

public class MemberInsertCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap(); // model값을 map에 넣음
		MemberDto memberDto = (MemberDto)map.get("memberDto"); // map에서 dto값을 뺌
		
		Map<String, Object> resultMap = new HashMap<String, Object>(); // map을 만듬
		
		// dao의 memberinsert값을 빼야함
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		resultMap.put("result", memberDao.memberInsert(memberDto));
		
		return resultMap; // 값을 가져온다. map이 한명들으면 1, 없으면 0반환
	}

}
