package com.koreait.classick.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.classick.command.cart.CartDeleteCommand;
import com.koreait.classick.command.cart.CartInsertCommand;
import com.koreait.classick.command.cart.CartListCommand;

@Controller 
public class CartController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private CartInsertCommand cartInsertCommand;
	private CartListCommand cartListCommand;
	private CartDeleteCommand cartDeleteCommand;
	
	@Autowired
	public void setCommand(CartInsertCommand cartInsertCommand, 
						   CartListCommand cartListCommand,
						   CartDeleteCommand cartDeleteCommand) {
		this.cartInsertCommand = cartInsertCommand;
		this.cartListCommand = cartListCommand;
		this.cartDeleteCommand = cartDeleteCommand;
	}
	
	@RequestMapping(value = "cartInsert.do", method = RequestMethod.POST, produces = "text/plain; charset=utf-8" )
	@ResponseBody
	public String addCart(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		return cartInsertCommand.execute(sqlSession, model);
	}

	@RequestMapping(value = "cartListPage.do", method = RequestMethod.GET)
	public String cartListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		return cartListCommand.execute(sqlSession, model);
	}

	@RequestMapping(value = "cartDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String cartDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		return cartDeleteCommand.execute(sqlSession, model);
	}

	
	
}
