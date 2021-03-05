package com.koreait.classick.command.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.common.Paging;
import com.koreait.classick.dao.NoticeDao;
import com.koreait.classick.dto.NoticeDto;

public class NoticeListCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String strPage = request.getParameter("page");
		int page = 1;
		if (strPage != null && !strPage.isEmpty()) {
			page = Integer.parseInt(strPage);
		}

		int totalRecord = noticeDao.totalRecord();

		int recordPerPage = 10;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		if (endRecord > totalRecord) {
			endRecord = totalRecord;
		}

		List<NoticeDto> list = noticeDao.list(beginRecord, endRecord);
		String paging = Paging.getPaging("noticeListPage.do", totalRecord, recordPerPage, page);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("page", page);
		model.addAttribute("recordPerPage", recordPerPage);

	}

}
