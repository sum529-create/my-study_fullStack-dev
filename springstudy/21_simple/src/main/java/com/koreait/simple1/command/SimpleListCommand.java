package com.koreait.simple1.command;

import org.springframework.ui.Model;

import com.koreait.simple1.dao.SimpleDao;

public class SimpleListCommand implements SimpleCommand {

	@Override
	public void execute(Model model) {
		// JSP와 달리 command는 데이터만 처리하면 됩니다.
		model.addAttribute("list", SimpleDao.getInstance().simpleList());
		
	}

}
