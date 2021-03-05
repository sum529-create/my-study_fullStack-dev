package com.koreait.classick.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.FaqDao;

public class FaqInsertCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlsession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		String fWriter = request.getParameter("fWriter");
		
		FaqDao faqDao = sqlsession.getMapper(FaqDao.class);
		
		faqDao.faqInsert(fTitle, fContent, fWriter);
		
	}

}
