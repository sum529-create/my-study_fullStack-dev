package com.koreait.classick.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.CartDao;
import com.koreait.classick.dao.RoleDao;
import com.koreait.classick.dto.LoginDto;
import com.koreait.classick.dto.MemberDto;

public class MemberLoginCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setMEmail(request.getParameter("mEmail"));
		memberDto.setMPw(request.getParameter("mPw"));
		
		// 권한 부여 작업한 부분
		// 사용자의 이메일 정보와 비밀번호를 확인해서 사용자 정보와 권한 정보를 함께 가져와 loginDto로 받는다.
		RoleDao roleDao = sqlSession.getMapper(RoleDao.class);
		LoginDto loginDto = roleDao.setLoginDto(memberDto);
		
		// 위의 코드로 대체되었음(Line 29-30)
		// MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		// MemberDto loginDto = memberDao.selectLogin(memberDto);	
		
		if(loginDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginDto", loginDto);

			// 사용자의 장바구니 등록 상품 개수 가져오기
			CartDao cartDao = sqlSession.getMapper(CartDao.class);
			session.setAttribute("itemCount", cartDao.getItemCount(loginDto.getMNo()));
		} else {
			HttpSession session = request.getSession();
			session.invalidate();
		}
	}

}
