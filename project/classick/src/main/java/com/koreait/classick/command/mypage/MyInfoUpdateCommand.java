package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;
public class MyInfoUpdateCommand implements MyPageAjaxCommand{
	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		String mSno = "";
		String mName = ((Map)map.get("map")).get("mName").toString();
		String mEmail = ((Map)map.get("map")).get("mEmail").toString();
		String mGender = "";
		String mPhone = "";
		if(((Map)map.get("map")).get("mSno") != null) {
			((Map)map.get("map")).get("mSno").toString();
		}
		if( ((Map)map.get("map")).get("mGender") != null ) {
			mGender = ((Map)map.get("map")).get("mGender").toString();
		}
		if(((Map)map.get("map")).get("mPhone") != null) {
			mPhone = ((Map)map.get("map")).get("mPhone").toString();
		}
		int mNo = Integer.parseInt(((Map)map.get("map")).get("mNo").toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		resultMap.put("result", memberDao.updateMyInfo(mSno, mName, mEmail, mGender, mPhone, mNo));
		
		return resultMap;
	}
}
