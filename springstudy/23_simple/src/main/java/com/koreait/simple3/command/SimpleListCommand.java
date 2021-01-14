package com.koreait.simple3.command;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.ui.Model;

import com.koreait.simple3.command.SimpleCommand;
import com.koreait.simple3.config.AppContext;
import com.koreait.simple3.dao.SimpleDao;

public class SimpleListCommand  implements SimpleCommand {
	@Override
	public void execute(Model model) {
		// JSP와 달리 command는 데이터만 처리하면 됩니다.
		//model.addAttribute("list", SimpleDao.getInstance().simpleList());
		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext.class);
		SimpleDao simpleDao = ctx.getBean("simpleDao", SimpleDao.class);
		
		// simpleDao.xxx();
	}
}
