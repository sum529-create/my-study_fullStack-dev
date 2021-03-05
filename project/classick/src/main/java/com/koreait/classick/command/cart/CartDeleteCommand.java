package com.koreait.classick.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.CartDao;

public class CartDeleteCommand implements CartCommand {

	@Override
	public String execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int cNo = 0;
		String str_cNo = request.getParameter("cNo");
		
		if(str_cNo != null && !str_cNo.isEmpty()) {
			cNo = Integer.parseInt(str_cNo);
		}
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		int result = cartDao.delete(cNo);
		
		return result + "";
	}

}
