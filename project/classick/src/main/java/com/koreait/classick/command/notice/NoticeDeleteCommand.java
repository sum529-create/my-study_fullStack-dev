package com.koreait.classick.command.notice;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.NoticeDao;

public class NoticeDeleteCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String strNo = request.getParameter("nNo");
		int no = 0;
		if (strNo != null && !strNo.isEmpty()) {
			no = Integer.parseInt(strNo);
		}
		// 테이블 데이터 삭제 
		noticeDao.delete(no);

		// 첨부가 있으면 첨부파일 삭제
		String filename = request.getParameter("nFilename");
		String realPath = request.getServletContext().getRealPath("resources/storage/notice");
		File file = new File(realPath, filename);
		if (file.exists()) {
			file.delete();
		}
	}

}
