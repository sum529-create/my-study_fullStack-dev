package com.koreait.classick.command.mypage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.dao.MemberDao;

public class UpdateBannerCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		int mNo = Integer.parseInt(multipartRequest.getParameter("mNo"));
		String aComment = multipartRequest.getParameter("aComment");
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		MultipartFile aFile = multipartRequest.getFile("aFile");
		MultipartFile bFile = multipartRequest.getFile("bFile");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 결과전달
		boolean result = false;
		
		if (aFile != null && !aFile.isEmpty() && bFile != null && !bFile.isEmpty()) {
			String originalFilename1 = aFile.getOriginalFilename();
			String originalFilename2 = bFile.getOriginalFilename();
			
			String extension1 = originalFilename1.substring( originalFilename1.lastIndexOf(".") + 1 );
			String filename1 = originalFilename1.substring( 0, originalFilename1.lastIndexOf(".") );
			String mPFilename1 = filename1 +
					                "_" +
					                System.currentTimeMillis() +
					                "." +
					                extension1;
			String extension2 = originalFilename2.substring( originalFilename2.lastIndexOf(".") + 1 );
			String filename2 = originalFilename2.substring( 0, originalFilename2.lastIndexOf(".") );
			String mPFilename2 = filename2 +
					"_" +
					System.currentTimeMillis() +
					"." +
					extension2;
			/*저장경로 변경*/
			String realPath = multipartRequest.getServletContext().getRealPath("assets/storage");
			
			File dir = new File(realPath);
			if ( !dir.exists() ) {
				dir.mkdirs();
			}
			
			File uploadFile1 = new File(realPath, mPFilename1);
			File uploadFile2 = new File(realPath, mPFilename2);
			try {
				aFile.transferTo(uploadFile1);
				bFile.transferTo(uploadFile2);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			memberDao.updateBanner(mPFilename1, aComment, mPFilename2, mNo);
			result = true;
			resultMap.put("aComment", aComment);
			resultMap.put("aImage", mPFilename1);
			resultMap.put("bImage", mPFilename2);
		}else if(aFile != null && !aFile.isEmpty()) {
			String originalFilename1 = aFile.getOriginalFilename();
			
			String extension1 = originalFilename1.substring( originalFilename1.lastIndexOf(".") + 1 );
			String filename1 = originalFilename1.substring( 0, originalFilename1.lastIndexOf(".") );
			String mPFilename1 = filename1 +
					                "_" +
					                System.currentTimeMillis() +
					                "." +
					                extension1;
			/*저장경로 변경*/
			String realPath = multipartRequest.getServletContext().getRealPath("assets/storage");
			
			File dir = new File(realPath);
			if ( !dir.exists() ) {
				dir.mkdirs();
			}
			
			File uploadFile1 = new File(realPath, mPFilename1);
			try {
				aFile.transferTo(uploadFile1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			memberDao.updateBanner(mPFilename1, aComment, "", mNo);
			result = true;
			resultMap.put("aImage", mPFilename1);
			resultMap.put("aComment", aComment);
			resultMap.put("bImage", memberDao.selectBanner(mNo).get("BIMAGE"));
			
		}else if(bFile != null && !bFile.isEmpty()) {
			String originalFilename2 = bFile.getOriginalFilename();
			
			String extension2 = originalFilename2.substring( originalFilename2.lastIndexOf(".") + 1 );
			String filename2 = originalFilename2.substring( 0, originalFilename2.lastIndexOf(".") );
			String mPFilename2 = filename2 +
					"_" +
					System.currentTimeMillis() +
					"." +
					extension2;
			/*저장경로 변경*/
			String realPath = multipartRequest.getServletContext().getRealPath("assets/storage");
			
			File dir = new File(realPath);
			if ( !dir.exists() ) {
				dir.mkdirs();
			}
			
			File uploadFile2 = new File(realPath, mPFilename2);
			try {
				bFile.transferTo(uploadFile2);
			} catch (Exception e) {
				e.printStackTrace();
			}
			;
			result = true;
			memberDao.updateBanner("", aComment, mPFilename2, mNo);
			resultMap.put("aImage", memberDao.selectBanner(mNo).get("AIMAGE"));
			resultMap.put("aComment", aComment);
			resultMap.put("bImage", mPFilename2);
		}else {
			return resultMap;
		}
		resultMap.put("result", result);
		return resultMap;
		
	}

}
