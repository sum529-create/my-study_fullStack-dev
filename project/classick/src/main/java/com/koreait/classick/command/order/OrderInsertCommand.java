package com.koreait.classick.command.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.CartDao;
import com.koreait.classick.dao.OrdersDao;
import com.koreait.classick.dto.LoginDto;
import com.koreait.classick.dto.OrdersDto;

public class OrderInsertCommand implements OrderCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		OrdersDao orderDao = sqlSession.getMapper(OrdersDao.class);
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int mNo = 0;
		HttpSession session = request.getSession();
		LoginDto loginDto = (LoginDto) session.getAttribute("loginDto");
		if(loginDto != null) {
			mNo = loginDto.getMNo();
		}
//		String str_mNo = request.getParameter("mNo");
//		if(str_mNo != null && !str_mNo.isEmpty()) {
//			mNo = Integer.parseInt(str_mNo);
//		}
		String oAddr = request.getParameter("oAddr");
		String oPhone = request.getParameter("oPhone");
		String totalPrice = request.getParameter("totalPrice");
		String oPayment = request.getParameter("oPayment");
		
		String[] str_pNos = request.getParameterValues("pNo");
		String[] str_cNos = request.getParameterValues("cNo");
		String[] oAmounts = request.getParameterValues("oAmount");
		String[] oOptions = request.getParameterValues("oOption");
		String[] itemPrices = request.getParameterValues("itemPrice");
		
		int pNo = 0;
		
		OrdersDto orderDto = null;
		List<OrdersDto> orderDtoList = new ArrayList<OrdersDto>();
		
		for (int i = 0; i < str_pNos.length; i++) {
			pNo = Integer.parseInt(str_pNos[i]);
			
			orderDto = new OrdersDto();
			
			orderDto.setMNo(mNo);
			orderDto.setPNo(pNo);
			orderDto.setOAddr(oAddr);
			orderDto.setOPhone(oPhone);
			orderDto.setOPayment(oPayment);
			orderDto.setONote("totalPrice:" + totalPrice + "&itemPrices:" + itemPrices);
			orderDto.setOAmount(oAmounts[i]);	
			orderDto.setOOption(oOptions[i]);
			
			orderDtoList.add(orderDto);
			orderDto = null;
		}
		
		int result = 0;
		if(orderDtoList.size() > 0) {
			for (int i = 0; i < orderDtoList.size(); i++) {
				result += orderDao.insert(orderDtoList.get(i));
			}
		}
		for (int i = 0; i < str_cNos.length; i++) {
			cartDao.delete(Integer.parseInt(str_cNos[i]));
		}
		
		if(loginDto != null) {
			if(session.getAttribute("itemCount") != null) {
				session.removeAttribute("itemCount");
				session.setAttribute("itemCount", cartDao.getItemCount(mNo));
			}
		}
		
		model.addAttribute("result",result);
		
	}
}
