package com.koreait.classick.dao;

import com.koreait.classick.dto.LoginDto;
import com.koreait.classick.dto.MemberDto;

public interface RoleDao {
	
	public int roleInsert(String mEmail);
	
	public LoginDto setLoginDto(MemberDto memberDto);
	
}
