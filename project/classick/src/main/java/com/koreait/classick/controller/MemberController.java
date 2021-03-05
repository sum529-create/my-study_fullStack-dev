package com.koreait.classick.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.classick.command.member.EmailCheckCommand;
import com.koreait.classick.command.member.EmailCheckListCommand;
import com.koreait.classick.command.member.EmailConfirmCommand;
import com.koreait.classick.command.member.MemberInsertCommand;
import com.koreait.classick.command.member.MemberListCommand;
import com.koreait.classick.command.member.MemberLoginCommand;
import com.koreait.classick.command.member.MemberPwChangeCommand;
import com.koreait.classick.command.member.PwConfirmCommand;

@Controller
public class MemberController {

	// field
	@Autowired
	private SqlSession sqlSession;
	private MemberListCommand memberListCommand;
	private MemberInsertCommand memberInsertCommand;
	private EmailCheckCommand emailCheckCommand;
	private EmailCheckListCommand emailCheckListCommand;
	private MemberLoginCommand memberLoginCommand;
	private EmailConfirmCommand emailConfirmCommand;
	private PwConfirmCommand pwConfirmCommand;
	private MemberPwChangeCommand memberPwChangeCommand;
	
	@Autowired
	public void setCommand(MemberListCommand memberListCommand,
						   MemberInsertCommand memberInsertCommand,
						   EmailCheckCommand emailCheckCommand,
						   EmailCheckListCommand emailCheckListCommand,
						   MemberLoginCommand memberLoginCommand,
						   EmailConfirmCommand emailConfirmCommand,
						   PwConfirmCommand pwConfirmCommand,
						   MemberPwChangeCommand memberPwChangeCommand) {
		this.memberListCommand = memberListCommand;
		this.memberInsertCommand = memberInsertCommand;
		this.emailCheckCommand = emailCheckCommand;
		this.emailCheckListCommand = emailCheckListCommand;
		this.memberLoginCommand = memberLoginCommand;
		this.emailConfirmCommand = emailConfirmCommand;
		this.pwConfirmCommand = pwConfirmCommand;
		this.memberPwChangeCommand = memberPwChangeCommand;
		
	}
	// 메인화면 이동
	@RequestMapping(value= {"/","index"}) 
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "memberListPage.do", method=RequestMethod.GET)
	public String list(Model model) {
		memberListCommand.execute(sqlSession, model);
		return "/member/memberListPage";
	}
	// 회원가입 리스트페이지 이동
	@RequestMapping(value="memberSignListUp.do", method=RequestMethod.GET)
	public String signUpList() {
		return "/member/memberSignUpList";
	}
	// 이메일로 회원가입 페이지 이동
	@RequestMapping(value="memberEmailSignup.do", method=RequestMethod.GET)
	public String EmailSignUP() {
		return "/member/memberSignUp";
	}
	// 회원가입 완료 후 메인페이지로 이동
	@RequestMapping(value="memberSignUp.do", method=RequestMethod.POST)
	public String memberSignUp(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberInsertCommand.execute(sqlSession, model);
		return "index";
	}
	// 로그인 페이지 이동
	@RequestMapping(value="loginPage.do", method=RequestMethod.GET)
	public String loginPage() {
		return "/member/memberLoginPage";
	}
	// 회원 이메일/비밀번호 찾기 페이지 이동
	@RequestMapping(value="memberLoginInfo.do", method=RequestMethod.GET)
	public String memberLoginInfo() {
		return "/member/memberLoginInfo";
	}
	// 로그인 검사 유무
	@RequestMapping(value="memberlogin.do", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberLoginCommand.execute(sqlSession, model);
		return "/member/memberLoginResult";
	}
	// 로그인 후 header.jsp로 이동
	@RequestMapping(value="header.do", method=RequestMethod.GET)
	public String headergo() {
		return "/template/header";
	}
	// 세션종료 로그아웃 단순이동
	@RequestMapping(value="memberLogOut.do", method=RequestMethod.GET)
	public String LogOut() {
		return "/member/memberLogOut";
	}
	// 비밀번호 변경 페이지 이동
	@RequestMapping(value="PwChange.do", method=RequestMethod.GET)
	public String PwChange() {
		return "/member/memberPwChange";
	}
	// 비밀번호 변경
	@RequestMapping(value="memberPwChange.do",
					method=RequestMethod.POST)
	public String memberPwChange(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberPwChangeCommand.execute(sqlSession, model);
		return "/member/memberPwResult";
	}
	
	// 메일 인증
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="emailCheckGo.do",
					method=RequestMethod.POST,
				    produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> email(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("mailSender", mailSender);
		return emailCheckCommand.execute(sqlSession, model);
	}
	
	// 이메일 찾기 인증
	@RequestMapping(value="userPhoneCheck.do",
				    method=RequestMethod.POST,
				    produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailCheck(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("mailSender", mailSender);
		return emailConfirmCommand.execute(sqlSession, model);
	}
	// 이메일로 비밀번호 찾기
	@RequestMapping(value="userPwCheck.do",
		    method=RequestMethod.POST,
		    produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> PwCheck(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("mailSender", mailSender);
		return pwConfirmCommand.execute(sqlSession, model);
	}
	// 회원가입 이메일 중복 확인
	@RequestMapping(value="emailListCheckGo.do",
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		return emailCheckListCommand.execute(sqlSession, model);
		
	}
	
}




























