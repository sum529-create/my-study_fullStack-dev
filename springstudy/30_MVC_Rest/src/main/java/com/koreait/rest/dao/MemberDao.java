package com.koreait.rest.dao;

import java.util.List;

import com.koreait.rest.dto.MemberDto;

public interface MemberDao {
	public List<MemberDto> memberList();
	
	public MemberDto memberView(int no);
	
	public int memberInsert(MemberDto memberDto);
	
	public int memberUpdate(MemberDto memberDto);
	
	public int memberDelete(int no);
}
