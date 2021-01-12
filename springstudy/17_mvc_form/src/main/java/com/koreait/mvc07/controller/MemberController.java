package com.koreait.mvc07.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
// 이부분의 @RequestMapping은 실무에서 많이 사용하지 않는다. index페이지가 애매해지기 때문 
public class MemberController {
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String goIndex() {
		return "index";
	}
	// @GetMapping(value="member/loginPage.do")
	
	@RequestMapping(value="member/loginPage.do", method=RequestMethod.GET)
	// @RequestMapping(value="member/loginPage") <a href="member/loginPage"> 태그에 의해서 이동되는 매핑
	public String goLoginPage() {
		return "member/loginPage";	// member 폴더 아래 loginPage.jsp를 의미합니다. 변경이 되지 앟는다.
	}
	@RequestMapping(value="member/login.do", method=RequestMethod.POST)
	public String goLogin(@RequestParam("id") String id,
							@RequestParam("pw") String pw, 
							Model model) {
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		return "member/loginResult";	// member 폴더 아래 loginResult.jsp를 의미합니다.
	}
}
