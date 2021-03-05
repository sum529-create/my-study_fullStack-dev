package com.koreait.mvc03.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/*
 * RequestMapping의 값은 주소에서 사용됩니다.
 * 실제 폴더 구조를 의미하지 않습니다.
 */

@Controller

@RequestMapping("member")	// 이 컨트롤의 모든 RequestMapping은 member로 시작합니다. (자동으로 추가됩니다.)
public class MemberController {
	
	// 1. signUpPage.jsp 이동하기 (단순 이동)
	// https://localhost:9090/mvc03/member/signUpPage
	
	@RequestMapping("signUpPage")
	public String singUpPage() {
		// return에서 실제 폴더와 파일명을 작성합니다.
		return "member/signUpPage";		// return "/WEB-INF/views/member/signUpPage.jsp";
	}
}
