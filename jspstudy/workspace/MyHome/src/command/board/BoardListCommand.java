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

public class BoardListCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 전체 게시글의 개수 구하기
		int totalRecord = BoardDao.getInstance().getTotalRecord();
		
		// page가 전달되지 않으면 1페이지를 연다.
		String strPage = request.getParameter("page");
		if (strPage == null || strPage.isEmpty()) {
			strPage = "1";
		}
		int page = Integer.parseInt(strPage);
		
		// page와 recordPerPage와 totalRecord를 알면 beginRecord와 endRecord를 구할 수 있다.
		// BoardListCommand는 한 페이지에 3개를 표시한다.
		int recordPerPage = 3;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;
		
		// beginRecord와 endRecord를 DB로 보내기 위해서 하나로 만든다.
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRecord", beginRecord);
		map.put("endRecord", endRecord);
		
		// Map을 DB에 전달하고 해당 목록을 가져온다.
		List<BoardDto> list = BoardDao.getInstance().boardList(map);
		
		// 페이지 번호(Paging)를 생성한다.
		String paging = Paging.getPaging("/MyHome/boardListPage.board", totalRecord, recordPerPage, page);
		
		// 조회수 관련
		// 열린 게시글 닫기
		HttpSession session = request.getSession();
		if (session.getAttribute("open") != null) {
			session.removeAttribute("open");
		}
		// boardListPage.jsp에 넘길 데이터를 request에 저장한다.
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("page", page);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("recordPerPage", recordPerPage);
		
		// boardListPage.jsp로 포워드한다.
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/boardListPage.jsp");
		pathNRedirect.setRedirect(false);  // forward
		return pathNRedirect;
	}

}
