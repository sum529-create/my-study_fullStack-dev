package com.koreait.classick.command.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.classick.common.AjaxPaging;
import com.koreait.classick.dao.MemberDao;

public class ReviewListCommand implements MyPageAjaxCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int mNo = Integer.parseInt(((Map)map.get("map")).get("mNo").toString());
		int page = Integer.parseInt(((Map)map.get("map")).get("page").toString());
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int totalRecord = memberDao.totalRecordR(mNo);  // 항상 똑같습니다.
		// SimpleList는 한 페이지에 몇 개의 레코드를 표시할 것인지 여기서 결정합니다.
		int recordPerPage = 4;  // 각 ListCommand마다 다르게 설정해도 됩니다.
		
		int beginRecord = (page - 1) * recordPerPage + 1;  // 항상 똑같습니다.
		int endRecord = beginRecord + recordPerPage - 1;  // 항상 똑같습니다.
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;  // 항상 똑같습니다.
		// beginRecord + endRecord를 list를 가져오는 simpleList()에 전달합니다.
		// rn을 적용해서 리스트 가져오기 새로 작성
		List<Map<String, Object>> list = memberDao.selectReviewList(beginRecord, endRecord, mNo);
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
