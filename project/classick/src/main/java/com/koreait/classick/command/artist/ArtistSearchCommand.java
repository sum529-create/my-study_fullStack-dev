package com.koreait.classick.command.artist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.dao.ArtistDao;
import com.koreait.classick.dto.ArtistDto;

public class ArtistSearchCommand implements ArtistAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		String p = map.get("p").toString();
		// 앞뒤 공백 제거
		p = p.trim();
		ArtistDao artistDao = sqlSession.getMapper(ArtistDao.class);
		List<ArtistDto> list = artistDao.searchList(p);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		return resultMap;
	}

}
