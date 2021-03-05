package com.koreait.classick.dao;

import java.util.List;
import java.util.Map;

import com.koreait.classick.dto.MemberDto;
import com.koreait.classick.dto.ReviewDto;

public interface MemberDao {
	
	// MyPage Func
	public List<MemberDto> list();
	public MemberDto myInfo(int mNo);
	public int updateMyInfo(String mSno, String mName, String mEmail, String mGender, String mPhone, int mNo);
	public int updateAddr(String mName, String mPno, String mAddr, String mLastAddr, String mPhone, int mNo);
	public int updatePayment(String mPayment, int mNo);
	public int updateProfile(String mPFilename,int mNo);
	public Map<String, Object> isArtist(int mNo);
	public int updateBanner(String mPFilename1 ,String aComment ,String mPFilename2, int mNo);
	public Map<String, Object> selectBanner(int mNo);
	// 회원탈퇴 기능
	
	public int deleteMyReview(int mNo);
	public int deleteMyOrders(int mNo);
	public int deleteMyCart(int mNo);
	public int deleteMyStock(int mNo);
	public int deleteMyProduct(int mNo);
	public int deleteMyArtist(int mNo);
	public int deleteMyRole(int mNo);
	public int deleteMyInfo(int mNo);
	public int deleteMyProductReview(int mNo);
	public int deleteMyProductOrders(int mNo);
	
	// 회원탈퇴 끝
	
	
	// SignUp Func
	public MemberDto memberEmailListCheck(String mEmail);
	public int memberInsert(String mName, String mEmail, String mPw, String mPhone);
	
	// Login Func
	public MemberDto selectLogin(MemberDto memberDto);
	public String selectEmail(String mPhone);
	public String selectPw(String mEmail);
	public int updatePw(String mEmail, String mPw, String ChPw);

	// Review Func
	public List<Map<String, Object>> selectMyOrdersList(int beginRecord, int endRecord, int mNo);
	public int totalRecord(int mNo);
	public int insertReview(int pNo, int oNo, int mNo, String rTitle, String rContent, String mPFilename, int rRating );
	public int hasReview(int oNo, int mNo);
	public int deleteReview(int oNo, int mNo);
	public Map<String, Object> selectrNo(int oNo, int mNo);
	public ReviewDto reviewView(int rNo);
	public int updateReview(String rTitle, String rContent, String mPFilename, int rRating, int rNo);
	public List<Map<String, Object>> selectReviewList(int beginRecord, int endRecord, int mNo);
	public int totalRecordR(int mNo);
	
}
