package com.koreait.classick.command.artist;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.ArtistDao;

public class ArtistHomeCommand implements ArtistCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int aNo = Integer.parseInt(request.getParameter("aNo"));
		ArtistDao artistDao = sqlSession.getMapper(ArtistDao.class);
		model.addAttribute("artistDto", artistDao.artistHomeInfo(aNo));
		model.addAttribute("productList",artistDao.artistHomeProductList(aNo));
		model.addAttribute("countProductList",artistDao.countArtistProduct(aNo));
		model.addAttribute("countReviewList",artistDao.countReviewList(aNo));
	}

}
