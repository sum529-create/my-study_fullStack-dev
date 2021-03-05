package com.koreait.classick.command.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.classick.dao.AdminDao;
import com.koreait.classick.dto.AdminMemberDto;

public class AdminMemberViewCommand implements AdminCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int mNo = (int)map.get("mNo");
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		AdminMemberDto adminMemberDto = adminDao.adminMemberView(mNo);
		if(adminMemberDto != null) {
			resultMap.put("adminMemberDto", adminMemberDto);
			resultMap.put("result", true);
		}
		else {
			resultMap.put("result", false);
		}
		
		return resultMap;
	}

}
