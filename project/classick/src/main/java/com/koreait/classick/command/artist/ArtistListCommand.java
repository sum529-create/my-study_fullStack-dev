package com.koreait.classick.command.artist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.common.AjaxPaging;
import com.koreait.classick.dao.ArtistDao;

public class ArtistListCommand implements ArtistAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		int page = (int)map.get("page");
		ArtistDao artistDao = sqlSession.getMapper(ArtistDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int totalRecord = artistDao.totalRecordA();  // 항상 똑같습니다.
		// SimpleList는 한 페이지에 몇 개의 레코드를 표시할 것인지 여기서 결정합니다.
		int recordPerPage = 3;  // 각 ListCommand마다 다르게 설정해도 됩니다.
		
		int beginRecord = (page - 1) * recordPerPage + 1;  // 항상 똑같습니다.
		int endRecord = beginRecord + recordPerPage - 1;  // 항상 똑같습니다.
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;  // 항상 똑같습니다.
		
		// beginRecord + endRecord를 list를 가져오는 simpleList()에 전달합니다.
		List<Map<String,Object>> list = artistDao.artistList(beginRecord, endRecord);
		
		// list에서 
		
		for(int i = beginRecord; i <= endRecord; i++) {
			int p = (i % recordPerPage < 1) ? recordPerPage : (i%recordPerPage);
			int result = 0;
			try {
				result = Integer.parseInt(String.valueOf(artistDao.artistHasProduct(beginRecord+p-1).get("A")));
			} catch (Exception e) {
				result = 0;
			}
			if(result == 1){
				list.get(p-1).put("PRODUCTLIST", artistDao.artistProductList(beginRecord+p-1));
				list.get(p-1).put("ARATING", artistDao.artistRating(beginRecord+p-1));
			}
			// artist가 등록한 물품이 있을 때만 아티스트 목록에 등장
			
		}
		
		
		String paging = AjaxPaging.getPaging(totalRecord, recordPerPage, page);
		resultMap.put("paging", paging);
		resultMap.put("list", list);
		resultMap.put("page", page);
		
		if (list.size() > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		return resultMap;
		
	}

}
