package com.koreait.classick.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.classick.command.admin.AdminMemberDeleteCommand;
import com.koreait.classick.command.admin.AdminMemberInsertCommand;
import com.koreait.classick.command.admin.AdminMemberListCommand;
import com.koreait.classick.command.admin.AdminMemberSearchCommand;
import com.koreait.classick.command.admin.AdminMemberUpdateCommand;
import com.koreait.classick.command.admin.AdminMemberViewCommand;
import com.koreait.classick.dto.AdminMemberDto;
import com.koreait.classick.dto.PageVo;

@Controller
public class AdminController {

	// field
	@Autowired
	private SqlSession sqlSession;

	private AdminMemberListCommand adminMemberListCommand;
	private AdminMemberInsertCommand adminMemberInsertCommand;
	private AdminMemberViewCommand adminMemberViewCommand;
	private AdminMemberUpdateCommand adminMemberUpdateCommand;
	private AdminMemberDeleteCommand adminMemberDeleteCommand;
	private AdminMemberSearchCommand adminMemberSearchCommand;
	
	@Autowired
	public void setCommand(AdminMemberListCommand adminMemberListCommand,
							AdminMemberInsertCommand adminMemberInsertCommand,
							AdminMemberViewCommand adminMemberViewCommand,
							AdminMemberUpdateCommand adminMemberUpdateCommand,
							AdminMemberDeleteCommand adminMemberDeleteCommand,
							AdminMemberSearchCommand adminMemberSearchCommand) {
		this.adminMemberListCommand = adminMemberListCommand;
		this.adminMemberInsertCommand = adminMemberInsertCommand;
		this.adminMemberViewCommand = adminMemberViewCommand;
		this.adminMemberUpdateCommand = adminMemberUpdateCommand;
		this.adminMemberDeleteCommand = adminMemberDeleteCommand;
		this.adminMemberSearchCommand = adminMemberSearchCommand;
	}
	
	/* 기본 이동 */
	@RequestMapping(value = "adminPage.do", method=RequestMethod.GET)
	public String adminPage(Model model) {
		return "/admin/adminPage";
	}
	
	@RequestMapping(value = "adminUserList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminUserList(Model model) {
		return "/admin/adminUserListPage";
	}
	
	@RequestMapping(value = "adminUserSearch.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminUserSearch(HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		adminMemberSearchCommand.execute(sqlSession, model);
		return "/admin/adminUserSearch";
	}
	
	/* command */
	@RequestMapping(value="memberList.do",
	        method=RequestMethod.POST,
	        produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> adminMemberList(@RequestBody PageVo pageVo, Model model){
		model.addAttribute("page", pageVo.getPage());
		return adminMemberListCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="memberView.do",
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberView(@RequestBody AdminMemberDto adminMemberDto, Model model){
		model.addAttribute("mNo", adminMemberDto.getmNo());
		return adminMemberViewCommand.execute(sqlSession, model);
	}
	
	// 폼 데이터는 multipartRequest로 전달됩니다.
	// AdminMEmberDto로 전달되지 않는다.
	@RequestMapping(value="memberInsert.do",
	        method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> adminMemberInsert(MultipartHttpServletRequest multipartRequest, Model model){
		model.addAttribute("multipartRequest", multipartRequest);
		return adminMemberInsertCommand.execute(sqlSession, model);
	}
	
	// 추가 의견을 드리자면,
	// REST 방식과 아닌 방식이 뒤섞인 컨트롤러 입니다. 통일해야 합니다.
	// 실제 구현에서 REST 방식은 사용하지 않기로 했습니다.
	
	
	/*@RequestMapping(value="member", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminMemberInsert(@ModelAttribute AdminMemberDto adminMemberDto,MultipartHttpServletRequest multipartRequest,Model model){
		if(adminMemberDto != null) {
			model.addAttribute("adminMemberDto", adminMemberDto);
			model.addAttribute("multipartRequest", multipartRequest);
		}
		return adminMemberInsertCommand.execute(sqlSession, model);
	}*/
	
	@RequestMapping(value="memberUpdate.do",
			method={RequestMethod.GET, RequestMethod.POST},
            produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> adminMemberUpdate(MultipartHttpServletRequest multipartRequest, Model model){
		model.addAttribute("multipartRequest", multipartRequest);
		return adminMemberUpdateCommand.execute(sqlSession, model);
		
	}
	
	@RequestMapping(value="memberDelete.do",
            method=RequestMethod.POST,
            produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> admingMemberDelete(@RequestBody AdminMemberDto adminMemberDto, Model model){
		model.addAttribute("mNo", adminMemberDto.getmNo());
		model.addAttribute("rNo", adminMemberDto.getrNo());
		model.addAttribute("pNo", adminMemberDto.getpNo());
		model.addAttribute("aNo", adminMemberDto.getaNo());
		return adminMemberDeleteCommand.execute(sqlSession, model);
	}
}
