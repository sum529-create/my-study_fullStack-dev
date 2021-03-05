package com.koreait.classick.command.mypage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;
import com.koreait.classick.dto.LoginDto;

public class DeleteMyInfoCommand implements MyPageCommand{
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		LoginDto memberDto = (LoginDto)session.getAttribute("loginDto");
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int mNo = memberDto.getMNo();
		memberDao.deleteMyReview(mNo);
		memberDao.deleteMyOrders(mNo);
		memberDao.deleteMyProductOrders(mNo);
		memberDao.deleteMyCart(mNo);
		memberDao.deleteMyStock(mNo);
		memberDao.deleteMyProductReview(mNo);
		memberDao.deleteMyProduct(mNo);
		memberDao.deleteMyArtist(mNo);
		memberDao.deleteMyRole(mNo);
		// 세션 초기화 후 
		session.invalidate();
	}
}
