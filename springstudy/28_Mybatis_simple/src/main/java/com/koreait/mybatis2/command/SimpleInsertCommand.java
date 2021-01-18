package com.koreait.mybatis2.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis2.dao.SimpleDao;

public class SimpleInsertCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		// map에 담겨있는 값을 빼준다.
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		String writer = request.getParameter("writer");
		String title= request.getParameter("title");
		String content = request.getParameter("content");
		
		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		int insertResult = simpleDao.simpleInsert(writer, title, content);
		
		// 값이 넘어가지 않으니 model대신 addFlashAttribute()로 넣어준다.
		// model.addAttribute("insertResult", insertResult);
		
		// rttr은 리다이렉트할 때도 값을 전달할 수 있습니다.
		rttr.addFlashAttribute("insertResult", insertResult);
		
		// insert 후에 이동되었음을 JSP에게 알려주겠습니다.
		rttr.addFlashAttribute("afterInsert", true); // 값이 잘 전달되었다를 알림
		
	}

}
