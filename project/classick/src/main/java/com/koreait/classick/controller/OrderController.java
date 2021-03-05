package com.koreait.classick.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.classick.command.order.GetCartCommand;
import com.koreait.classick.command.order.GetCartCommand2;
import com.koreait.classick.command.order.OrderInsertCommand;

@Controller
public class OrderController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private GetCartCommand getCartCommand;
	private GetCartCommand2 getCartCommand2;
	private OrderInsertCommand orderInsertCommand;
	
	@Autowired
	public void setCommand(GetCartCommand getCartCommand,
							GetCartCommand2 getCartCommand2,
							OrderInsertCommand orderInsertCommand) {
		this.getCartCommand = getCartCommand;
		this.getCartCommand2 = getCartCommand2;
		this.orderInsertCommand = orderInsertCommand;
	}
	
	@RequestMapping(value = "orderInsertPage.do", method = RequestMethod.POST)
	public String orderPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		getCartCommand.execute(sqlSession, model);
		return "order/orderInsertPage";
	}

	@RequestMapping(value = "orderDirectInsertPage.do", method = RequestMethod.GET)
	public String orderDirectPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		getCartCommand2.execute(sqlSession, model);
		return "order/orderInsertPage";
	}
	
	@RequestMapping(value = "orderInsert.do", method = RequestMethod.POST)
	public String orderInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		orderInsertCommand.execute(sqlSession, model);
		return "order/orderResultPage";
	}
}
