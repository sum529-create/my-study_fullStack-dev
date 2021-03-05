package com.koreait.classick.command.notice;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.dao.NoticeDao;

public class NoticeUpdateCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("multipartRequest");

		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String oldFilename = multipartRequest.getParameter("oldFilename");
		String strNo = multipartRequest.getParameter("no");
		int no = 0;
		if (strNo != null && !strNo.isEmpty()) {
			no = Integer.parseInt(strNo);
		}

		MultipartFile file = multipartRequest.getFile("filename");

		if (file != null && !file.isEmpty()) {

			String originalFilename = file.getOriginalFilename();

			String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));

			String uploadFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
			String realPath = multipartRequest.getServletContext().getRealPath("resources/storage/notice");

			// 업로드할 경로가 없으면 storage 디렉토리를 만든다.
			File dir = new File(realPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			File uploadFile = new File(realPath, uploadFilename);

			// 첨부한 파일(MultipartFile file) -> 업로드(uploadFile)
			try {
				file.transferTo(uploadFile);

				// uploadFilename = URLEncoder.encode(uploadFilename,"utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			noticeDao.updateAll(title, content, uploadFilename, no);
			
			// 변경된 이미지는 삭제한다.
			if(oldFilename != null && !oldFilename.isEmpty() ) {
				File oldFile = new File(realPath, oldFilename);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}

		} else { // 첨부 데이터를 제외한 데이터 업데이트 

			noticeDao.update(title, content, no);

		}

	}

}
