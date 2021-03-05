package com.koreait.classick.dao;

import java.util.List;

import com.koreait.classick.dto.CartDto;
import com.koreait.classick.dto.CartListDto;

public interface CartDao {
	
	public int insert(int mNo, int pNo, int sNo, int cAmount, String cOption);
	public List<CartDto> getList(int mNo, int pNo);
	
	public CartListDto getCartListItem(int mNo, int pNo, String cNo);
	
	public int updateAmount(int cAmount, int cNo);
	
	public List<CartListDto> getCartList(int mNo, int pNo);
	
	public int getItemCount(int mNo);
	
	public List<Integer> getPNoList(int mNo);
	
	public int delete(int cNo);

}
