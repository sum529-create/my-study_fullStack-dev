package com.koreait.classick.command.order;

import java.util.ArrayList;
import java.util.Arrays;
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

public class GetCartCommand implements OrderCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		int mNo = 0;

		// 사용자의 정보를 가져온다.
		LoginDto loginDto = (LoginDto) session.getAttribute("loginDto");
		if(loginDto != null) {
			mNo = loginDto.getMNo();
			// 사용자의 정보를 model에 넣어둔다.
			model.addAttribute("memberDto", loginDto);
		}
		
		String[] str_pNos = request.getParameterValues("pNo");
		String[] str_cNos = request.getParameterValues("cNo");
		String[] str_sNos = request.getParameterValues("sNo");
		String[] str_cOption = request.getParameterValues("cOption");
		String[] str_cAmounts = request.getParameterValues("cAmount");
		String[] str_oAddPrice = request.getParameterValues("oAddPrice");
		
		List<String> pNos = Arrays.asList(str_pNos);
		
		int pNo = 0;
		List<CartListDto> list = null;
		CartArrayListDto newCartDto = null;
		List<CartArrayListDto> newList = new ArrayList<CartArrayListDto>();
		
		CartDao cartDao = sqlSession.getMapper(CartDao.class);
		
		String cNos = "";
		String sNos = "";
		String cAmounts = "";
		String cOptions = "";
		String stocks = "";
		String oAddPrices = "";
		int count = 0;
		int listMaxCount = 0;
		
		for (int i = 0; i < str_pNos.length; i++) {
			if(pNo != Integer.parseInt(str_pNos[i])) {
				pNo = Integer.parseInt(str_pNos[i]);
				
				listMaxCount = pNos.lastIndexOf(pNo + "");
				
				newCartDto = new CartArrayListDto();
				CartListDto cartListDto = cartDao.getCartListItem(mNo, pNo, str_cNos[i]);
				
				newCartDto.setMNo(cartListDto.getMNo());
				newCartDto.setPNo(cartListDto.getPNo());
				newCartDto.setPName(cartListDto.getPName());
				newCartDto.setPImage(cartListDto.getPImage());
				newCartDto.setPPrice(cartListDto.getPPrice());
				newCartDto.setPASDesc(cartListDto.getPASDesc());
				newCartDto.setANo(cartListDto.getANo());
				newCartDto.setAName(cartListDto.getAName());
				cNos  += str_cNos[i] + "&";
				sNos += str_sNos[i] + "&";
				cAmounts += str_cAmounts[i] + "&";
				cOptions += str_cOption[i] + "&";
				oAddPrices += str_oAddPrice[i] + "&";
				
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
					//count = 0;
					cNos = "";
					sNos = "";
					cAmounts = "";
					cOptions = "";
					stocks = "";
					oAddPrices = "";
				}
				count++;
				
			} else if(pNo == Integer.parseInt(str_pNos[i])) {
				cNos  += str_cNos[i] + "&";
				sNos += str_sNos[i] + "&";
				cAmounts += str_cAmounts[i] + "&";
				cOptions += str_cOption[i] + "&";
				oAddPrices += str_oAddPrice[i] + "&";
				
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
					cNos = "";
					sNos = "";
					cAmounts = "";
					cOptions = "";
					stocks = "";
					oAddPrices = "";
				}
				count++;
			} // else if
			
		} // for 
		
		model.addAttribute("cListDtoLists", newList);
		model.addAttribute("listSize", newList.size());

	} 

}
