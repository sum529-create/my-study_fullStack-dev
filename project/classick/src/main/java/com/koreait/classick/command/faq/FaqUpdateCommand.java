package com.koreait.classick.command.faq;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.classick.dao.FaqDao;

public class FaqUpdateCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlsession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		String fTitle = "";
		String fContent = "";
		
		fTitle = request.getParameter("fTitle");
		fContent = request.getParameter("fContent");
		int FNo = Integer.parseInt(request.getParameter("fNo"));
		
		FaqDao faqDao = sqlsession.getMapper(FaqDao.class);
		
		int updateResult = faqDao.faqUpdate(fTitle, fContent, FNo);
		
		rttr.addAttribute("updateResult", updateResult);
		rttr.addFlashAttribute("afterUpdate", true);
		
	}

}
