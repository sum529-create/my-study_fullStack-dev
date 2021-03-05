package com.koreait.simple2.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.simple2.dao.SimpleDao;

public class SimpleListCommand implements SimpleCommand {
	/*
		private SimpleDao simpleDao;
		
		@Autowired
		public void SetDao(SimpleDao simpleDao) {
			this.simpleDao = simpleDao;
		}
	 */
	// field
	@Autowired
	private SimpleDao simpleDao;
	
	@Autowired
	public void SetDao(SimpleDao simpleDao) {
		this.simpleDao = simpleDao;
	}
	
	// method
	@Override
	public void execute(Model model) {
		// simpleDao.xxx();
		model.addAttribute("list", simpleDao.simpleList());
	}

}