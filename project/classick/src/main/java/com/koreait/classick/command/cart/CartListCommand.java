package com.koreait.classick.command.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.CartDao;
import com.koreait.classick.dto.CartArrayListDto;
import com.koreait.classick.dto.CartListDto;
import com.koreait.classick.dto.LoginDto;

public class CartListCommand implements CartCommand {

	@Override
	public String execute(SqlSession sqlSession, Model model) {
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		// TODO 사용자의 세션에서 사용자 번호를 가져와서 mNo에 입력한다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		
		int mNo = 8;
		LoginDto loginDto = (LoginDto) session.getAttribute("loginDto");
		if(loginDto != null) {
			mNo = loginDto.getMNo();
			// 사용자의 정보를 model에 넣어둔다.
			// model.addAttribute("memberDto", loginDto);
		}
			
		int pNo = 0;
		List<Integer> pNos = cartDao.getPNoList(mNo);
		List<CartListDto> list = null;
		
		CartArrayListDto newCartDto = null;
		List<CartArrayListDto> newList = new ArrayList<CartArrayListDto>();
		
		String cNos = "";
		String sNos = "";
		String cAmounts = "";
		String cOptions = "";
		String stocks = "";
		String oAddPrices = "";
		int count = 0;
		int listMaxCount = 0;
		for (int i = 0; i < pNos.size(); i++) {
			if(pNo != pNos.get(i)) {	// 처음
				
				pNo = pNos.get(i);
				list = cartDao.getCartList(mNo, pNo);
				
				listMaxCount = list.size();
				
				newCartDto = new CartArrayListDto();
				CartListDto cartListDto = list.get(count);
				
				newCartDto.setMNo(cartListDto.getMNo());
				newCartDto.setPNo(cartListDto.getPNo());
				newCartDto.setPName(cartListDto.getPName());
				newCartDto.setPImage(cartListDto.getPImage());
				newCartDto.setPPrice(cartListDto.getPPrice());
				newCartDto.setPASDesc(cartListDto.getPASDesc());
				newCartDto.setANo(cartListDto.getANo());
				newCartDto.setAName(cartListDto.getAName());
				cNos  += cartListDto.getCNo() + "&";
				sNos += cartListDto.getSNo() + "&";
				cAmounts += cartListDto.getCAmount() + "&";
				cOptions += cartListDto.getCOption() + "&";
				stocks += cartListDto.getStock() + "&";
				oAddPrices += cartListDto.getOAddPrice() + "&";
				
				count++;
				
				if(count == listMaxCount) {
					newCartDto.setCNos(cNos);
					newCartDto.setSNos(sNos);
					newCartDto.setCAmounts(cAmounts);
					newCartDto.setCOptions(cOptions);
					newCartDto.setStocks(stocks);
					newCartDto.setOAddPrices(oAddPrices);
					newList.add(newCartDto);
					
					//  initialize
					newCartDto = null;
					count = 0;
					cNos = "";
					sNos = "";
					cAmounts = "";
					cOptions = "";
					stocks = "";
					oAddPrices = "";
				}
				
			} else if(pNo == pNos.get(i)) {
				CartListDto cartListDto = list.get(count);
				cNos  += cartListDto.getCNo() + "&";
				sNos += cartListDto.getSNo() + "&";
				cAmounts += cartListDto.getCAmount() + "&";
				cOptions += cartListDto.getCOption() + "&";
				stocks += cartListDto.getStock() + "&";
				oAddPrices += cartListDto.getOAddPrice() + "&";
				count++;
				
				if(count == listMaxCount) {
					newCartDto.setCNos(cNos);
					newCartDto.setSNos(sNos);
					newCartDto.setCAmounts(cAmounts);
					newCartDto.setCOptions(cOptions);
					newCartDto.setStocks(stocks);
					newCartDto.setOAddPrices(oAddPrices);
					newList.add(newCartDto);
					
					//  initialize
					newCartDto = null;
					count = 0;
					cNos = "";
					sNos = "";
					cAmounts = "";
					cOptions = "";
					stocks = "";
					oAddPrices = "";
				}
			}
		}
		
		if(session.getAttribute("itemCount") != null) {
			session.removeAttribute("itemCount");
			session.setAttribute("itemCount", cartDao.getItemCount(mNo));
		}
		
		model.addAttribute("cListDtoLists", newList);
		model.addAttribute("listSize", newList.size());
		
		return "cart/cartListPage";
	}

}
