package com.koreait.mybatis2.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mybatis2.dao.SimpleDao;

public class SimpleViewCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 파라미터 no의 전달 유무를 검사하는 것이 좋습니다.
		int no = Integer.parseInt(request.getParameter("no"));
		
		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		
		model.addAttribute("simpleDto", simpleDao.simpleView(no));
		
	}

}
