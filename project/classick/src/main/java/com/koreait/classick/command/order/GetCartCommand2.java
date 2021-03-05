package com.koreait.classick.command.order;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dto.LoginDto;

public class GetCartCommand2 implements OrderCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		LoginDto loginDto = (LoginDto) session.getAttribute("loginDto");
		
		int mNo = 0;
		if(loginDto != null) {
			mNo = loginDto.getMNo();
			System.out.println(mNo);
		}
		
		String[] str_pNos = request.getParameterValues("pNo");
		String[] str_sNos = request.getParameterValues("sNo");
		String[] str_cNos = request.getParameterValues("cNo");
		String[] str_cPrice = request.getParameterValues("unitPrice");
		String[] str_cAmounts = request.getParameterValues("cAmount");
		String[] str_cOption = request.getParameterValues("cOption");
		
		
		
		

	}

}
