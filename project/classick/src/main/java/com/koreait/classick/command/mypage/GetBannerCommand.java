package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.command.artist.ArtistAjaxCommand;
import com.koreait.classick.dao.MemberDao;

public class GetBannerCommand implements ArtistAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		int mNo = (int)map.get("mNo");
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("map", memberDao.selectBanner(mNo));
		return resultMap;
	}

}
