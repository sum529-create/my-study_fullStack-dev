package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.BoardDao;
import dto.BoardDto;

public class BoardViewCommand implements BoardCommand {
	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String page = request.getParameter("page");
		
		BoardDto boardDto = BoardDao.getInstance().boardView(bNo);
		
		HttpSession session = request.getSession();
		String open = (String)session.getAttribute("open");
		if(open == null || open.isEmpty()) {
			session.setAttribute("open", "yes");
			BoardDao.getInstance().boardUpdateHit(bNo);
		}
		request.setAttribute("boardDto", boardDto);
		request.setAttribute("result", boardDto != null); // null이 아니면 값이 있다
		request.setAttribute("page", page);

		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/boardViewPage.jsp");
		pathNRedirect.setRedirect(false);	// forward
		
		return pathNRedirect;
	}
}
