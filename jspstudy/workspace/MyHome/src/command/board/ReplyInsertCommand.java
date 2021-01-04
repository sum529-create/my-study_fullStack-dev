package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public class ReplyInsertCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String mId = request.getParameter("mId");
		int bNo = Integer.parseInt(request.getParameter("bNo"));	// 댓글 고유 번호 -> 현 번호 10 10 /n 현 번호 11 10 ...
		String bIp = request.getRemoteAddr();
		
		String page = request.getParameter("page");
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/replyInsertResult.board?page="+page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}
