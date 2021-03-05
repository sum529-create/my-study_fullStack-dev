package com.koreait.classick.command.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.AdminDao;
import com.koreait.classick.dto.AdminMemberDto;

public class AdminMemberDeleteCommand implements AdminCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int rNo = (int)map.get("rNo");
		int mNo = (int)map.get("mNo");
		int aNo = (int)map.get("aNo");
		int pNo = (int)map.get("pNo");
		
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminDao.adminMemberDelete1(mNo));
		resultMap.put("result", adminDao.adminMemberDelete2(mNo));
		resultMap.put("result", adminDao.adminMemberDelete3(mNo));
		resultMap.put("result", adminDao.adminMemberDelete4(pNo));
		resultMap.put("result", adminDao.adminMemberDelete4(aNo));
		resultMap.put("result", adminDao.adminMemberDelete5(aNo));
		resultMap.put("result", adminDao.adminMemberDelete6(rNo));
		resultMap.put("result", adminDao.adminMemberDelete7(mNo));
	
		
		return resultMap;
	}

}
