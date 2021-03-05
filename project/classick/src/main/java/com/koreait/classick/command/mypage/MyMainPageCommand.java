package com.koreait.classick.command.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;
import com.koreait.classick.dto.LoginDto;
import com.koreait.classick.dto.MemberDto;

public class MyMainPageCommand implements MyPageCommand {
	
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		LoginDto memberDto = (LoginDto)session.getAttribute("loginDto");
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		model.addAttribute("loginDto", memberDto);
		model.addAttribute("memberDto", memberDao.myInfo(memberDto.getMNo()));
	}
}
