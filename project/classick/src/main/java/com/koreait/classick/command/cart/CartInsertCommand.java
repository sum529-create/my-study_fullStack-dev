package com.koreait.classick.command.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.CartDao;
import com.koreait.classick.dto.CartDto;
import com.koreait.classick.dto.LoginDto;

public class CartInsertCommand implements CartCommand {

	int targetIdx = 0;

	@Override
	public String execute(SqlSession sqlSession, Model model) {

		CartDao cartDao = sqlSession.getMapper(CartDao.class);

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String str_pNo = request.getParameter("pNo");
		String[] sNos = request.getParameterValues("option-sNo");
		String[] optionContents = request.getParameterValues("option-content");
		String[] optionAmounts = request.getParameterValues("option-amount");

		List<String> sNosList = new ArrayList<String>();
		List<String> optionContentsList = new ArrayList<String>();
		List<String> optionAmountsList = new ArrayList<String>();
		for (int i = 0; i < sNos.length; i++) {
			sNosList.add(sNos[i]);
			optionContentsList.add(optionContents[i]);
			optionAmountsList.add(optionAmounts[i]);
		}

		int pNo = 0;

		// TODO 세션에서 사용자 정보를 꺼내어 mNo에 입력한다.
		int mNo = 0;
		HttpSession session = request.getSession();
		LoginDto loginDto = (LoginDto) session.getAttribute("loginDto");
		if(loginDto != null) {
			mNo = loginDto.getMNo();
		}

		if (str_pNo != null && !str_pNo.isEmpty()) {
			pNo = Integer.parseInt(str_pNo);
		}

		int result = 0;

		String sNosSum = "";
		String optionContentsSum = "";
		String optionAmountsSum = "";
		List<CartDto> list = cartDao.getList(mNo, pNo);

		if (list != null && list.size() != 0) { // 카트에 기존 저장되어 있는 데이터가 있을때는, update한다.
			for (CartDto cartDto : list) {
				for (int i = 0; i < sNos.length; i++) {
					if (cartDto.getSNo() == Integer.parseInt(sNos[i])) {
						result += cartDao.updateAmount(cartDto.getCAmount() + Integer.parseInt(optionAmounts[i]),
								cartDto.getCNo());
						sNosSum += sNos[i] + "&";
						optionContentsSum += optionContents[i] + "&";
						optionAmountsSum += optionAmounts[i] + "&";
					}
				}
			}
			if (sNosSum != null && !sNosSum.isEmpty()) {
				String[] sNosArray = sNosSum.split("&");
				String[] optionContentsArray = optionContentsSum.split("&");
				String[] optionAmountsArray = optionAmountsSum.split("&");

				for (int i = 0; i < sNosArray.length; i++) {
					sNosList.remove(sNosArray[i]);
					optionContentsList.remove(optionContentsArray[i]);
					optionAmountsList.remove(optionAmountsArray[i]);
				}
				for (int i = 0; i < sNosList.size(); i++) {
					result += cartDao.insert(mNo, pNo, Integer.parseInt(sNosList.get(i)), Integer.parseInt(optionAmountsList.get(i)), optionContentsList.get(i));
				}
			}
			
			if(sNosSum == "" || sNosSum == null || sNosSum.isEmpty() ){
				for (int i = 0; i < optionAmounts.length; i++) {
					result += cartDao.insert(mNo, pNo, Integer.parseInt(sNos[i]), Integer.parseInt(optionAmounts[i]),
							optionContents[i]);
				}
			}

		} else { // 카트에 이미 저장된 데이터가 없을때는 insert 한다.
			for (int i = 0; i < optionAmounts.length; i++) {
				result += cartDao.insert(mNo, pNo, Integer.parseInt(sNos[i]), Integer.parseInt(optionAmounts[i]),
						optionContents[i]);
			}
		}
		if(loginDto != null) {
			if(session.getAttribute("itemCount") != null) {
				session.removeAttribute("itemCount");
				session.setAttribute("itemCount", cartDao.getItemCount(mNo));
			}
		}
		//System.out.println(result);
		

		return result + "";
	}

}
