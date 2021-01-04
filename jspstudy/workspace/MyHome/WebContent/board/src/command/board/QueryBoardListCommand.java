package command.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Paging;
import common.PathNRedirect;
import dao.BoardDao;
import dto.BoardDto;

public class QueryBoardListCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		
		String strPage = request.getParameter("page");
		int page = 1;
		if (strPage != null && !strPage.isEmpty()) {
			page = Integer.parseInt(strPage);
		}
		
		// column + query를 DB에 전달하기 위해서 Map으로 만든다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("query", query);
		
		// 검색 결과 레코드의 개수를 가져온다.
		int totalQueryRecord = BoardDao.getInstance().getTotalQueryRecord(map);
		
		// 검색 결과는 한 페이지당 3개씩 보여준다.
		int recordPerPage = 3;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord < totalQueryRecord ? endRecord : totalQueryRecord;
		
		// beginRecord ~ endRecord 사이 목록을 가져온다.
		map.put("beginRecord", beginRecord + "");
		map.put("endRecord", endRecord + "");
		
		List<BoardDto> list = BoardDao.getInstance().queryBoardList(map);
		
		// paging을 만든다.
		String paging = Paging.getPaging("/MyHome/queryBoardListPage.board?column=" + column + "&query=" + query, totalQueryRecord, recordPerPage, page); 
		
		// 조회수 관련
		// 열린 게시글 닫기
		HttpSession session = request.getSession();
		if (session.getAttribute("open") != null) {
			session.removeAttribute("open");
		}
		
		// boardListPage.jsp로 넘겨 줄 데이터를 저장한다.
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("totalRecord", totalQueryRecord);
		request.setAttribute("page", page);
		request.setAttribute("recordPerPage", recordPerPage);
		
		// boardListPage.jsp로 포워드한다.
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/boardListPage.jsp");
		pathNRedirect.setRedirect(false);  // forward
		return pathNRedirect;
		
	}

}