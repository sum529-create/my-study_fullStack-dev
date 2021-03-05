package com.koreait.classick.dao;

import java.util.List;
import java.util.Map;

import com.koreait.classick.dto.AdminMemberDto;

public interface AdminDao {
	
	public List<AdminMemberDto> adminMemberList(int beginRecord, int endRecord);
	
	public AdminMemberDto adminMemberView(int mNo);
	
	public int adminMemberInsert1(AdminMemberDto adminMemberDto);
	public int adminMemberInsert2(AdminMemberDto adminMemberDto);
	
	public int adminMemberUpdate1(AdminMemberDto adminMemberDto);
	public int adminMemberUpdate2(AdminMemberDto adminMemberDto);
	
	public int adminMemberDelete1(int mNo);
	public int adminMemberDelete2(int mNo);
	public int adminMemberDelete3(int mNo);
	public int adminMemberDelete4(int pNo);
	public int adminMemberDelete5(int aNo);
	public int adminMemberDelete6(int aNo);
	public int adminMemberDelete7(int rNo);
	public int adminMemberDelete8(int mNo);
	
	public int getTotalMemberCount();
	
	public List<AdminMemberDto> adminMemberSearch(Map<String, String> resultMap);
}
