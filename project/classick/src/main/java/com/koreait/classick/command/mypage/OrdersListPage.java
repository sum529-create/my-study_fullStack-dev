package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.common.AjaxPaging;
import com.koreait.classick.dao.MemberDao;

public class OrdersListPage implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int mNo = Integer.parseInt(((Map)map.get("map")).get("mNo").toString());
		int page = Integer.parseInt(((Map)map.get("map")).get("page").toString()) ;		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int totalRecord = memberDao.totalRecord(mNo);  // 항상 똑같습니다.
		// SimpleList는 한 페이지에 몇 개의 레코드를 표시할 것인지 여기서 결정합니다.
		int recordPerPage = 5;  // 각 ListCommand마다 다르게 설정해도 됩니다.
		
		int beginRecord = (page - 1) * recordPerPage + 1;  // 항상 똑같습니다.
		int endRecord = beginRecord + recordPerPage - 1;  // 항상 똑같습니다.
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;  // 항상 똑같습니다.
		
		// beginRecord + endRecord를 list를 가져오는 simpleList()에 전달합니다.
		List<Map<String, Object>> list = memberDao.selectMyOrdersList(beginRecord, endRecord, mNo);
		int oNo = 0; 
		for(int i = beginRecord; i <= endRecord; i++) {
			int p = (i % 5 < 1) ? 5 : (i%5); 
			oNo = Integer.parseInt(list.get(p-1).get("ONO").toString());
			Map<String, Object> rNoMap = memberDao.selectrNo(oNo, mNo);
			if(rNoMap == null) { // null인데 어떻게 값을 넣지?
				rNoMap = new HashMap<>();
				rNoMap.put("RNO", 0);
				list.get(p-1).put("rNoMap", rNoMap);
			}else {
				list.get(p-1).put("rNoMap", rNoMap);
			}
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
