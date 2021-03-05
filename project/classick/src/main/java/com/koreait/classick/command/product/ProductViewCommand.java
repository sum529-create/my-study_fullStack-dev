package com.koreait.classick.command.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.ProductDao;
import com.koreait.classick.dao.StockDao;

public class ProductViewCommand implements ProductCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int pNo = 0;
		String strPno = request.getParameter("pNo");
		if(strPno != null && !strPno.isEmpty()){
			pNo = Integer.parseInt(strPno);
		}
		
		ProductDao productDao = sqlSession.getMapper(ProductDao.class);
		model.addAttribute("productArtistDto", productDao.view(pNo));
		
		StockDao stockDao = sqlSession.getMapper(StockDao.class);
		model.addAttribute("stockList", stockDao.list(pNo));
		
	}

}
