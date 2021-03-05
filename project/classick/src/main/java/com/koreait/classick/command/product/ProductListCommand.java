package com.koreait.classick.command.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.common.Paging;
import com.koreait.classick.dao.ProductDao;
import com.koreait.classick.dto.ProductArtistDto;

public class ProductListCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String category = request.getParameter("category");
		String strPage = request.getParameter("page");
		int page = 1;
		if (strPage != null && !strPage.isEmpty()) {
			page = Integer.parseInt(strPage);
		}

		int totalRecord = productDao.totalRecordByCategory(category);

		int recordPerPage = 10;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		if (endRecord > totalRecord) {
			endRecord = totalRecord;
		}

		List<ProductArtistDto> list = productDao.list(category, beginRecord, endRecord);
		String paging = Paging.getPaging("productListPage.do?category=" + category, totalRecord, recordPerPage, page);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("page", page);
		model.addAttribute("recordPerPage", recordPerPage);

	}

}
