package com.koreait.simple2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.simple2.command.SimpleDeleteCommand;
import com.koreait.simple2.command.SimpleInsertCommand;
import com.koreait.simple2.command.SimpleListCommand;
import com.koreait.simple2.command.SimpleUpdateCommand;
import com.koreait.simple2.command.SimpleViewCommand;

@Controller
public class SimpleController {
	// root-context.xml에 정의된 Bean 중에서
	// command 들을 필요로 하는 곳입니다.
	
	/*
	 * 1. 일일이 생성하기
	 * @Autowired
	 * private SimpleListCommand simpleListCommand;
	 * @Autowired
	 * private SimpleViewCommand simpleViewCommand;
	 * ...
	 * 필드에 하나씩 @Autowired를 생성해야 한다.
	 */
	
	/*
	 * @Autowired의 적용대상은 필드, 메소드 모두 가능합니다.
	 * 2. 메소드의 매개변수에 배치해서 한 번에 생성하기
	 * @Autowired
	 * public void setCommand(SimpleListCommand simpleListCommand,
	 * 							SimpleViewCommand simpleViewCommand,
	 * 							SimpleInsertCommand simpleInsertCommand,
 	 * 							SimpleUpdateCommand simpleUpdateCommand,
	 * 							SimpleDeleteCommand simpleDeleteCommand){
	 * 			this.simpleListCommand = simpleListCommand;
	 * 			this.simpleViewCommand = simpleViewCommand;
	 * 			this.simpleInsertCommand = simpleInsertCommand;
	 * 			this.simpleUpdateCommand = simpleUpdateCommand;
	 * 			this.simpleDeleteCommand = simpleDeleteCommand;
	 * 
	 * }
	 */
	
	// field
		private SimpleListCommand simpleListCommand;
		private SimpleViewCommand simpleViewCommand;
		private SimpleInsertCommand simpleInsertCommand;
		private SimpleUpdateCommand simpleUpdateCommand;
		private SimpleDeleteCommand simpleDeleteCommand;
		
		
		// Bean을 자동으로 생성해 주는 메소드
		@Autowired
		public void setCommand(SimpleListCommand simpleListCommand,
		                       SimpleViewCommand simpleViewCommand,
		                       SimpleInsertCommand simpleInsertCommand,
		                       SimpleUpdateCommand simpleUpdateCommand,
		                       SimpleDeleteCommand simpleDeleteCommand) {
		    this.simpleListCommand = simpleListCommand;
		    this.simpleViewCommand = simpleViewCommand;
		    this.simpleInsertCommand = simpleInsertCommand;
		    this.simpleUpdateCommand = simpleUpdateCommand;
		    this.simpleDeleteCommand = simpleDeleteCommand;
		}  
	
	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	
	@RequestMapping(value="simpleList.do")
	public String simpleList(Model model) {
		simpleListCommand.execute(model);
		return "simple/simpleListPage";
	}
}
