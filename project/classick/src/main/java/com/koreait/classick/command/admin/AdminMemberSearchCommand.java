package com.koreait.classick.command.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.AdminDao;

public class AdminMemberSearchCommand {

	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		
		Map<String, String>resultMap = new HashMap<String, String>();
		resultMap.put("column", column);
		resultMap.put("query", query);
		
		model.addAttribute("list", adminDao.adminMemberSearch(resultMap));
	}
	
}
