package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;
import com.koreait.classick.dto.ReviewDto;

public class ReviewViewCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		int rNo = (int)map.get("rNo");
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("reviewDto", memberDao.reviewView(rNo));
		
		return resultMap;
	}

}
