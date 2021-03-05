package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class UpdatePaymentCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int mNo = Integer.parseInt(((Map)map.get("map")).get("mNo").toString());
		String mPayment = "";
		if(((Map)map.get("map")).get("mPayment") != null) {
			((Map)map.get("map")).get("mPayment").toString();
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		resultMap.put("result", memberDao.updatePayment(mPayment, mNo));
		return resultMap;
	}

}
