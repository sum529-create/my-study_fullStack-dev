package com.koreait.mybatis3.command;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class BoardInsertCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		
		// multipartRequest에 저장된 일반 파라미터는 getParameter()를 씁니다.
		String writer = multipartRequest.getParameter("writer");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		
		// 1. multipartRequest에 저장된 첨부가 1개일 때는 getFile()을 씁니다.
		/* <input type="file" name="filename"/>
			MultipartFile file = multipartRequest.getFile("filename");
		*/
		
		// 2. multipartRequest에 저장된 첨부가 multiple일 때는 getFiles()를 씁니다.
		// 첨부 타입이 multiple이면 첨부된 파일들은 List에 저장되서 넘어옵니다.
		// 각 첨부 파일들의 타입은 MultipartFile입니다.
		/*
		  	<input type="file" name="files" multiple/>
		  	List<MultipartFiles> files = multipartReqeust.getFiles("files");
		 */
		List<MultipartFile> files = multipartRequest.getFiles("files");
	}

}
