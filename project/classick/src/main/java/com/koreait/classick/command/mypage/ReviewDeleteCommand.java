package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class ReviewDeleteCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		int mNo = Integer.parseInt(((Map)map.get("map")).get("mNo").toString());
		int oNo = Integer.parseInt(((Map)map.get("map")).get("oNo").toString());
		int page = Integer.parseInt(((Map)map.get("map")).get("page").toString());
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", memberDao.deleteReview(oNo, mNo));
		resultMap.put("page", page);
		return resultMap;
	}

}
