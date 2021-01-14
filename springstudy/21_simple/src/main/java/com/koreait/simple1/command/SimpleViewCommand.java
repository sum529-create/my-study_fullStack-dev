package com.koreait.simple1.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.simple1.dao.SimpleDao;
import com.koreait.simple1.dto.SimpleDto;

public class SimpleViewCommand implements SimpleCommand {

	@Override
	public void execute(Model model) {
		// simpleController의 simpleViewPage 메소드
		// command은 model이란 값만 받아올 수 있다.
		// request에 담겨있는 no값을 command가 가져와야 한다.
		// 그러기 위해서 request값을 model에 아예 넘겨버리자.
		// jsp에서 전달한 값은 request로 no가 오고, 
		// command에 넘기기위해 model로 넘긴다.
		// 따라서 이 곳 model은 request가 들어가 있고, request을 통째로 빼서 no값을 뺀다.
		
		// model을 Map으로 바꿔줍니다.
		Map<String, Object> map = model.asMap();
		// model에 있는 작업들을 map으로 빼준다.
		
		// map에서 request를 뺍니다. 빼는 것은 get,  넣는 것은 put
		HttpServletRequest request =(HttpServletRequest) map.get("request");
		
		// request에서 no를 뺍니다.
		int no = Integer.parseInt(request.getParameter("no"));
		
		// no값을 가진 simpleDto를 가져옵니다.
		SimpleDto simpleDto = SimpleDao.getInstance().simpleView(no);
		
		// 결과인 simpleDto를 jsp에 전달해줘야한다. simpleViewPage.jsp로 전달해야 합니다.
		// JSP로 보내는 데이터는 model에 저장해주세요.
		model.addAttribute("simpleDto", simpleDto);
		
		
	}

}
