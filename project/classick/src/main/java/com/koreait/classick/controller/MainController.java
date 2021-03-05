package com.koreait.classick.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.classick.command.tabs.PopularWorksCommand;
import com.koreait.classick.command.tabs.RecentWorksCommand;

@Controller
public class MainController {
	@Autowired
	private SqlSession sqlSession;
	
	private PopularWorksCommand popularWorksCommand;
	private RecentWorksCommand recentWorksCommand;
	@Autowired
	public void setCommand(PopularWorksCommand popularWorksCommand,
							RecentWorksCommand recentWorksCommand) {
		this.popularWorksCommand = popularWorksCommand;
		this.recentWorksCommand = recentWorksCommand;
	}
	
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	// footer 이용약관 메뉴 페이지 이동
	@RequestMapping(value = "termsConditions.do", method = RequestMethod.GET)
	public String termsConditions() {
		return "info/termsConditionsPage";
	}

	@RequestMapping(value = "privacyPolicy.do", method = RequestMethod.GET)
	public String privacyPolicy() {
		return "info/privacyPolicyPage";
	}
	
	@RequestMapping(value = "popularWorks.do", method = RequestMethod.GET)
	public String popularWorks(HttpServletRequest request ,Model model) {
		model.addAttribute("request", request);
		popularWorksCommand.execute(sqlSession, model);
		return "mypage/popularWorks";
	}
	@RequestMapping(value = "recentWorks.do", method = RequestMethod.GET)
	public String recentWorks(HttpServletRequest request ,Model model) {
		model.addAttribute("request", request);
		recentWorksCommand.execute(sqlSession, model);
		return "mypage/recentWorks";
	}
}
