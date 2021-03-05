package com.koreait.classick.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.command.notice.NoticeDeleteCommand;
import com.koreait.classick.command.notice.NoticeInsertCommand;
import com.koreait.classick.command.notice.NoticeListCommand;
import com.koreait.classick.command.notice.NoticeUpdateCommand;
import com.koreait.classick.command.notice.NoticeViewCommand;
import com.koreait.classick.dto.NoticeDto;

@Controller
public class NoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoticeListCommand noticeListCommand;
	private NoticeViewCommand noticeViewCommand;
	private NoticeInsertCommand noticeInsertCommand;
	private NoticeUpdateCommand noticeUpdateCommand;
	private NoticeDeleteCommand noticeDeleteCommand;
	
	@Autowired
	public void setCommand(NoticeListCommand noticeListCommand,
						   NoticeViewCommand noticeViewCommand,
						   NoticeInsertCommand noticeInsertCommand,
						   NoticeUpdateCommand noticeUpdateCommand,
						   NoticeDeleteCommand noticeDeleteCommand) {
		this.noticeListCommand = noticeListCommand;
		this.noticeViewCommand = noticeViewCommand;
		this.noticeInsertCommand = noticeInsertCommand;
		this.noticeUpdateCommand = noticeUpdateCommand;
		this.noticeDeleteCommand = noticeDeleteCommand;
	}
	
	@RequestMapping(value = "noticeListPage.do", method = RequestMethod.GET)
	public String noticeListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		noticeListCommand.execute(sqlSession, model);
		return "notice/noticeListPage";
	}

	@RequestMapping(value = "noticeViewPage.do", method = RequestMethod.GET)
	public String noticeViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		noticeViewCommand.execute(sqlSession, model);
		return "notice/noticeViewPage";
	}

	@RequestMapping(value = "noticeInsertPage.do", method = RequestMethod.GET)
	public String noticeInsertPage() {
		return "notice/noticeInsertPage";
	}
	
	@RequestMapping(value = "noticeInsert.do", method = RequestMethod.POST)
	public String noticeInsert(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		noticeInsertCommand.execute(sqlSession, model);
		return "redirect:noticeListPage.do";
	}

	@RequestMapping(value = "noticeUpdatePage.do", method = RequestMethod.POST)
	public String noticeUpdatePage(@ModelAttribute("noticeDto") NoticeDto noticeDto, Model model) {
		return "notice/noticeUpdatePage";
	}
	
	@RequestMapping(value = "noticeUpdate.do", method = RequestMethod.POST)
	public String noticeUpdate(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		noticeUpdateCommand.execute(sqlSession, model);
		return "redirect:noticeListPage.do";
	}

	@RequestMapping(value = "noticeDelete.do", method = RequestMethod.POST)
	public String noticeDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		noticeDeleteCommand.execute(sqlSession, model);
		return "redirect:noticeListPage.do";
	}
}
