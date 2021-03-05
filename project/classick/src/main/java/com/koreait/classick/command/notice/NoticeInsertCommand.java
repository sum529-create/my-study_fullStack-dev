package com.koreait.classick.command.notice;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.dao.NoticeDao;

public class NoticeInsertCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("multipartRequest");

		String title = multipartRequest.getParameter("title");
		String writer = multipartRequest.getParameter("writer");
		String content = multipartRequest.getParameter("content");

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

			noticeDao.insert(title, content, writer, uploadFilename);

		} else { // 첨부가 없는 데이터를 테이블에 저장합니다.

			noticeDao.insert(title, content, writer, "");

		}

	}

}
