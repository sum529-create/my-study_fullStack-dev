package com.koreait.mybatis3.command;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mybatis3.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// 테이블의 데이터 삭제
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		boardDao.boardDelete(no);
		
		// 첨부가 있으면 첨부파일 삭제
		String filename = request.getParameter("filename");
		String realPath = request.getServletContext().getRealPath("resources/storage");
		File file = new File(realPath, filename);
		if(file.exists()) {
			file.delete();
		}
	}

}
