package com.koreait.classick.command.mypage;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.classick.dao.MemberDao;

public class ProfileUpdateCommand implements MyPageCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		int mNo = Integer.parseInt(multipartRequest.getParameter("mNo"));
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		MultipartFile file = multipartRequest.getFile("file");
		if (file != null && !file.isEmpty()) {
			String originalFilename = file.getOriginalFilename();
			
			String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
			String filename = originalFilename.substring( 0, originalFilename.lastIndexOf(".") );
			String mPFilename = filename +
					                "_" +
					                System.currentTimeMillis() +
					                "." +
					                extension;
			
			String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
			
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
			memberDao.updateProfile(mPFilename, mNo);
			rttr.addFlashAttribute("memberDto", memberDao.myInfo(mNo));
		}else {
			memberDao.updateProfile("", mNo);
		}
	}

}
