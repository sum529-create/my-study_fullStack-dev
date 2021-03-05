package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class GetTotalOrderCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int mNo = (int)map.get("mNo");
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", memberDao.totalRecord(mNo));
		return resultMap;
	}

}
