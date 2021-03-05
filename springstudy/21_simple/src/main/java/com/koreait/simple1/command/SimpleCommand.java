package com.koreait.simple1.command;

import org.springframework.ui.Model;

public interface SimpleCommand {
	// 공통 내용
	public void execute(Model model);
	
}
