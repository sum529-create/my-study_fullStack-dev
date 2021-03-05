package com.koreait.classick.command.artist;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.ArtistDao;

public class ArtistReviewCommand implements ArtistAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		int aNo = (int)map.get("aNo");
		ArtistDao artistDao = sqlSession.getMapper(ArtistDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("reviewList", artistDao.artistReviewList(aNo));
		
		return resultMap;
	}

}
