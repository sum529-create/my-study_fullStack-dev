package com.koreait.classick.command.mypage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.dao.MemberDao;

public class ReviewInsertCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		String rTitle = multipartRequest.getParameter("rTitle");
		String rContent = multipartRequest.getParameter("rContent");
		int rRating = Integer.parseInt(multipartRequest.getParameter("rRating"));
		int mNo = Integer.parseInt(multipartRequest.getParameter("mNo"));
		int pNo = Integer.parseInt(multipartRequest.getParameter("pNo"));
		int oNo = Integer.parseInt(multipartRequest.getParameter("oNo"));
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		MultipartFile file = multipartRequest.getFile("rFile");
		
		// 결과전달
		boolean result = false;
		
		if (file != null && !file.isEmpty()) {
			String originalFilename = file.getOriginalFilename();
			
			String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
			String filename = originalFilename.substring( 0, originalFilename.lastIndexOf(".") );
			String mPFilename = filename +
					                "_" +
					                System.currentTimeMillis() +
					                "." +
					                extension;
			/*저장경로 변경*/
			String realPath = multipartRequest.getServletContext().getRealPath("assets/storage");
			
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
			memberDao.insertReview(pNo, oNo, mNo, rTitle, rContent, mPFilename, rRating);
			result = true;
		}else {
			memberDao.insertReview(pNo, oNo, mNo, rTitle, rContent, "", rRating);
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		
		return resultMap;
	}

}
