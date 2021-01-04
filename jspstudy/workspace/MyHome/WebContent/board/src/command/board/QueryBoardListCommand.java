package command.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.BoardDao;

public class QueryBoardListCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String column = request.getParameter("column");	// option값
		String query = request.getParameter("query");   // 검색 값
		
		String strpage = request.getParameter("page");
		int page = 1;
		if(strpage == null || strpage.isEmpty()) {
			page = Integer.parseInt(strpage);
		}
		
		// column + query를 DB에 전달하기 위해서 Map으로 만든다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("query", query);
		
		// 검색 결과 레토드의 개수를 가져온다.
		int totalRecord = BoardDao.getInstance().getTotalQueryRecord(map);
		
		// 검색 결과는 한 페이지당 3개씩 보여준다.
		int recordPerPage = 10;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;
		
		// beginRecord ~ endRecord 사이 목록을 가져온다.
		
		
		return null;
	}

}
