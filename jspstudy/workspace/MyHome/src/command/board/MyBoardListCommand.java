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
import dto.MemberDto;

public class MyBoardListCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String strPage = request.getParameter("page");
		int page = 1;
		if (strPage != null && !strPage.isEmpty()) {
			page = Integer.parseInt(strPage);
		}
		
		// 작성자의 mId를 Map에 추가한다.
		Map<String, String> map = new HashMap<String, String>();
		HttpSession session = request.getSession();
		MemberDto loginDto = (MemberDto) session.getAttribute("loginDto");
		if (loginDto != null) {
			map.put("mId", loginDto.getmId());
		}
		
		// 내가 작성한 레코드의 개수를 가져온다.
		int totalMyRecord = BoardDao.getInstance().getTotalMyRecord(map);
		
		// 내가 작성한 레코드 결과는 한 페이지당 5개씩 보여준다.
		int recordPerPage = 5;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord < totalMyRecord ? endRecord : totalMyRecord;
		
		// beginRecord ~ endRecord 사이 목록을 가져온다.
		map.put("beginRecord", beginRecord + "");
		map.put("endRecord", endRecord + "");
		
		List<BoardDto> list = BoardDao.getInstance().myBoardList(map);
		
		// paging을 만든다.
		String paging = Paging.getPaging("/MyHome/myBoardListPage.board", totalMyRecord, recordPerPage, page); 
		
		// 조회수 관련
		// 열린 게시글 닫기
		if (session.getAttribute("open") != null) {
			session.removeAttribute("open");
		}
		
		// boardListPage.jsp로 넘겨 줄 데이터를 저장한다.
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("totalRecord", totalMyRecord);
		request.setAttribute("page", page);
		request.setAttribute("recordPerPage", recordPerPage);
		
		// boardListPage.jsp로 포워드한다.
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/boardListPage.jsp");
		pathNRedirect.setRedirect(false);  // forward
		return pathNRedirect;
		
	}

}