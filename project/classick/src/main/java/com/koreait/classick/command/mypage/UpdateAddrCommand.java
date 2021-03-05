package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class UpdateAddrCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		String mPno = "";
		String mName = "";
		String mAddr = "";
		String mLastAddr = "";
		String mPhone = "";
		
		if(((Map)map.get("map")).get("mPno") != null) {
			mPno = ((Map)map.get("map")).get("mPno").toString();
		}
		if(((Map)map.get("map")).get("mName") != null) {
			mName = ((Map)map.get("map")).get("mName").toString();
		}
		if(((Map)map.get("map")).get("mAddr") != null) {
			mAddr = ((Map)map.get("map")).get("mAddr").toString();
		}
		if( ((Map)map.get("map")).get("mLastAddr") != null ) {
			mLastAddr = ((Map)map.get("map")).get("mLastAddr").toString();
		}
		if(((Map)map.get("map")).get("mPhone") != null) {
			mPhone = ((Map)map.get("map")).get("mPhone").toString();
		}
		
		int mNo = Integer.parseInt(((Map)map.get("map")).get("mNo").toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		resultMap.put("result", memberDao.updateAddr(mName, mPno, mAddr, mLastAddr, mPhone, mNo));
		
		return resultMap;
	}

}
