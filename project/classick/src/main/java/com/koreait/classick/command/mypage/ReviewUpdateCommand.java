package com.koreait.classick.command.mypage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.dao.MemberDao;

public class ReviewUpdateCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		int rNo = Integer.parseInt(multipartRequest.getParameter("rNo"));
		String rTitle = multipartRequest.getParameter("rTitle");
		String rContent = multipartRequest.getParameter("rContent");
		String rFilename = multipartRequest.getParameter("rFilename");
		int rRating = Integer.parseInt(multipartRequest.getParameter("rRating"));
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		MultipartFile file = multipartRequest.getFile("rFile");
		// 저장 경로 변경
		String realPath = multipartRequest.getServletContext().getRealPath("assets/storage");
		// 기존 첨부파일 삭제
		Map<String, Object> resultMap = new HashMap<String, Object>();
		boolean result = false;
		File deleteFile = new File(realPath, rFilename);
		if (deleteFile.exists()) {
			deleteFile.delete();
		}
		// 새 첨부파일 업로드
		if (file != null && !file.isEmpty()) {
			String originalFilename = file.getOriginalFilename();
			String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
			String filename = originalFilename.substring( 0, originalFilename.lastIndexOf(".") );
			String mPFilename = filename +
					                "_" +
					                System.currentTimeMillis() +
					                "." +
					                extension;
			File dir = new File(realPath);
			if ( !dir.exists() ) {
				dir.mkdirs();
			}
			
			File uploadFile = new File(realPath, mPFilename);
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			memberDao.updateReview(rTitle, rContent, mPFilename, rRating, rNo);
			result = true;
		}else {
			memberDao.updateReview(rTitle, rContent, "", rRating, rNo);
		}
		resultMap.put("result", result);
		
		return resultMap;
	}

}
