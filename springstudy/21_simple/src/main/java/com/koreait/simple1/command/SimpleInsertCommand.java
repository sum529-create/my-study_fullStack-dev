package com.koreait.simple1.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.simple1.dao.SimpleDao;
import com.koreait.simple1.dto.SimpleDto;

public class SimpleInsertCommand implements SimpleCommand {
	
	@Override
	public void execute(Model model) {
		
		// 전달 받은 model에는 request가 들어 있어요.
		// 그걸 꺼내야 합니다.
		
		// model에 저장된 속성을 직접 꺼내는 방법은 없어요.
		// attribute같은 것이 없음.
		// 대신 model은 Map으로 바꾸는 것이 가능합니다. (asMap() 메소드)
		
		// Map으로 바꾸고 나면 Map에서 꺼내는 메소드인 get() 메소드를 이용해서 꺼내면 됩니다.
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		// model에 저장
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		SimpleDto simpleDto = new SimpleDto();
		simpleDto.setWriter(writer);
		simpleDto.setTitle(title);
		simpleDto.setContent(content);
		
		SimpleDao.getInstance().simpleInsert(simpleDto);
	}
}
