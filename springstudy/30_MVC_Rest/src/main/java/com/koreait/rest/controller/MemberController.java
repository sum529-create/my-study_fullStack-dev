package com.koreait.rest.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.rest.command.MemberCommand;
import com.koreait.rest.command.MemberInsertCommand;
import com.koreait.rest.command.MemberListCommand;
import com.koreait.rest.command.MemberViewCommand;
import com.koreait.rest.dto.MemberDto;

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
					// url			// type						// dataType
	@RequestMapping(value="member", method=RequestMethod.POST, produces="application/json; charset=utf-8")// 반환시켜주는 데이터타입:produces)
	@ResponseBody		// json보내는 값이 view가 아니니 보내줘야함으로
	public Map<String, Object> memberInsert(@RequestBody MemberDto memberDto, Model model){ // 보내준 JSON.stringify(sendObj)값을 받아야한다. jackson이 자동적으로 json <-> dto 변환  
		if(memberDto != null) {
			model.addAttribute("memberDto", memberDto);
		}
		memberCommand = new MemberInsertCommand();
		return memberCommand.execute(sqlSession, model); // map타입이므로 바로 return가능
		// memberCommand.execute(sqlSession, model); 결과가 resultMap이므로 곧바로 반환합니다.
		
	}
	
	@RequestMapping(value="member/{no}",	// 경로에 포함된 변수는 @PathVariable로 받습니다
					method=RequestMethod.GET, 
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberView(@PathVariable("no")int no, Model model){ // model -> command	
		model.addAttribute("no", no);
		memberCommand = new MemberViewCommand();
		return memberCommand.execute(sqlSession, model);
	}
	
}
