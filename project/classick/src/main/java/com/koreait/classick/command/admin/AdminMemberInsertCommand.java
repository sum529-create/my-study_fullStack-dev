package com.koreait.classick.command.admin;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.dao.AdminDao;
import com.koreait.classick.dto.AdminMemberDto;

public class AdminMemberInsertCommand implements AdminCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		
		
		// 서버에 파일을 올리는 부분 **시작
		MultipartFile file = multipartRequest.getFile("mPFilename");
		
		String mPFilename = "";  // 원하면 첨부 없을 때 사용할 이름을 지정할 수 있습니다.
		
		AdminMemberDto adminMemberDto = new AdminMemberDto();
		if (file != null && !file.isEmpty()) {
			
			String originalFilename = file.getOriginalFilename();
			String extension = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
			String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
			
			mPFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
			String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
			
			File dir = new File(realPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			File uploadFile = new File(realPath, mPFilename);
			
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			adminMemberDto.setmPFilename(mPFilename); // insert 하면서 파일명을 함께 넣으면 되니까 여기서는 아무 일도 안합니다.
		}else {
			adminMemberDto.setmPFilename("/classick/assets/image/defaultPFile.jpg");
		}
		// 서버에 파일을 올리는 부분 **끝
		
		// 나머지 정보는 모두 DB로 보내야 되니까
		// multipartRequest에서 다 뺀 다음 adminMemberDto 만들고 DB로 보내는 작업 하시면 됩니다.
		
		
		// 여기서부터 DB로 데이터 보내는 영역입니다.
		String role = multipartRequest.getParameter("role");
		String mSno = multipartRequest.getParameter("mSno");
		String mName = multipartRequest.getParameter("mName");
		String mEmail = multipartRequest.getParameter("mEmail");
		String mPw = multipartRequest.getParameter("mPw");
		String mGender = multipartRequest.getParameter("mGender");
		String mPno = multipartRequest.getParameter("mPno");
		String mAddr = multipartRequest.getParameter("mAddr");
		String mLastAddr = multipartRequest.getParameter("mLastAddr");
		String mPhone = multipartRequest.getParameter("mPhone");
		String mPayment = multipartRequest.getParameter("mPayment");
		String mPoint = multipartRequest.getParameter("mPoint");
		String mGrade = multipartRequest.getParameter("mGrade");
		
		adminMemberDto.setRole(role);
		adminMemberDto.setmSno(mSno);
		adminMemberDto.setmName(mName);
		adminMemberDto.setmEmail(mEmail);
		adminMemberDto.setmPw(mPw);
		adminMemberDto.setmGender(mGender);
		adminMemberDto.setmPno(mPno);
		adminMemberDto.setmAddr(mAddr);
		adminMemberDto.setmLastAddr(mLastAddr);
		adminMemberDto.setmPhone(mPhone);
		adminMemberDto.setmPayment(mPayment);
		adminMemberDto.setmPoint(mPoint);
		adminMemberDto.setmGrade(mGrade);
		// adminMemberDto.setmPFilename(mPFilename);  // 첨부시간이 붙어 있는 파일명을 DB에 저장합니다.
		Map<String, Object> resultMap = new HashMap<String, Object>();
		AdminDao adminDao = sqlSession.getMapper(AdminDao.class);
		
		int result = adminDao.adminMemberInsert1(adminMemberDto);
		result = adminDao.adminMemberInsert2(adminMemberDto);
		
		
		resultMap.put("result", result);
		return resultMap;
		
	}

}
