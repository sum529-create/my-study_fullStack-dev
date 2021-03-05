package com.koreait.simple1.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.simple1.dao.SimpleDao;
import com.koreait.simple1.dto.SimpleDto;

public class SimpleUpdateCommand implements SimpleCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");	// request는 controller에서 만든 request
		
		// dao에서 만든 update중에 매개변수로 받을 simpleDto작업을 만들어 준다.
		SimpleDto simpleDto = new SimpleDto();
		simpleDto.setNo(Integer.parseInt(request.getParameter("no")));
		simpleDto.setTitle(request.getParameter("title"));
		simpleDto.setContent(request.getParameter("content"));
		
		SimpleDao.getInstance().simpleUpdate(simpleDto);
	}

}
