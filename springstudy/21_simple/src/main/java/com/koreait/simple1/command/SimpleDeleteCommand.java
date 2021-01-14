package com.koreait.simple1.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.simple1.dao.SimpleDao;

public class SimpleDeleteCommand implements SimpleCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		SimpleDao.getInstance().simpleDelete(Integer.parseInt(request.getParameter("no")));
		
		
	}

}
