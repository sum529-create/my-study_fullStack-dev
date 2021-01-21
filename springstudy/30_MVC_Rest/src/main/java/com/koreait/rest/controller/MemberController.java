package com.koreait.rest.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.rest.command.MemberCommand;
import com.koreait.rest.command.MemberListCommand;

@Controller
//@RestController // 자동적으로 @ResponseBody 생략됨
public class MemberController {						// 실제로는 JSON으로 보내준다. -> produces
	
	// field
	private MemberCommand memberCommand;
	
	@Autowired // SqlSession은 이미 정의가 되었으니 AutoWired를 작성해준다.
	private SqlSession sqlSession;
	
	// method
	@RequestMapping(value="member", method=RequestMethod.GET, produces="application/json; charset=utf-8")
	@ResponseBody // 반환 할 데이터가 view가 아님을 명시
	public Map<String, Object> memberList(Model model) {	// list가 아닌 map로 바꿔준다.
		memberCommand = new MemberListCommand();
		return memberCommand.execute(sqlSession, model);	// map 타입, map에 전체목록을 담아준다.
	}
	
	
	
}
