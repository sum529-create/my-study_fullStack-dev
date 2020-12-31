package command.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.BoardDao;

public class BoardListCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 전체 게시글의 개수 구하기
		int totalRecord = BoardDao.getInstance().getTotalRecord();
		
		
		// page가 전달되지 않으면 1페이지를 연다.
		String page = request.getParameter("page");
		if(page == null || page.isEmpty()) {
			page = "1";
		}
		
		
		// page와 recordPerPage를 알면 totalRecord를 알면 beginRecord와 endRecord를 구할 수 있다.
		// BoardListCommand는 한 페이지에 3개를 표시한다.
		// BBSListCommand - 5번
		int recordPerPage = 3;
		int beginRecord = (Integer.parseInt((page))-1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;
		
		// beginRecord와 endRecord를 DB로 보내기 위해서 하나로 만든다.
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRecord", endRecord);
		map.put("endRecord", endRecord);
		
		// Map을 DB에 전달하고 해당 목록을 가져온다.
		
		// 페이지 번호(paging)를 생성한다.
		
		// boardListPage.jsp에 넘길 데이터를 request에 저장한다.
		
		// 
		
		// boardListPage.jsp로 포워드 한다.
		
		
		return null;
	}

}
