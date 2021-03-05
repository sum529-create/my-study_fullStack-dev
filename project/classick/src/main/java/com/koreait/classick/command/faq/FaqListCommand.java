package com.koreait.classick.command.faq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.common.Paging;
import com.koreait.classick.dao.FaqDao;
import com.koreait.classick.dto.FaqDto;

public class FaqListCommand implements FaqCommand {

	@Override
	public void execute(SqlSession sqlsession, Model model) {

		FaqDao faqDao = sqlsession.getMapper(FaqDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String strPage = request.getParameter("page");
		if (strPage == null || strPage.isEmpty()) {
			strPage = "1";
		}
		
		int page = Integer.parseInt(strPage);
		
		int totalRecord = faqDao.totalRecord();
		int recordPerPage = 10;
		
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1; 
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;
		
		List<FaqDto> list = faqDao.faqList(beginRecord, endRecord);
		
		String paging = Paging.getPaging("faqListPage.do", totalRecord, recordPerPage, page);
		
		model.addAttribute("list", list);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("recordPerPage", recordPerPage);
		model.addAttribute("paging", paging);
		model.addAttribute("page", page);
		

		
	}

}
