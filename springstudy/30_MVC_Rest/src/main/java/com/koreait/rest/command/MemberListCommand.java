package com.koreait.rest.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.rest.dao.MemberDao;
import com.koreait.rest.dto.MemberDto;

public class MemberListCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		List<MemberDto> list = memberDao.memberList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); 		// map에 실어준다.
		if(list.size() > 0) {	// 자료가 있을 시
			map.put("result", true);	// 확인용
		}else {
			map.put("result", false);
		}
		
		return map; 
		// 반환타입을 map으로 한 이유? -> 결과를 넘겨줄때 json으로 넘긴다고하면
		// dto, dto가 잔뜩 들어간 list.
		// select는 map이 없어도 가능.
		// insert는 요청이 들어왔을때 성공/실패여부를 따져야 하는데 int방식
		// 그래서 i, d, v는 int를 사용한다.
		// jackson의 특성과 함께 이해할 것.
		// 공통 타입을 map으로 하였다.
		// int라 할 수 도 없고, dto라고도 할 수 없었다. 그래서 map<>방식 사용
		// => 반환타입의 공통 규칙을 뽑아내기 위해서!
		
		// list안에 Dto들이 존재. map에 list 넣어놓음
	}

}
