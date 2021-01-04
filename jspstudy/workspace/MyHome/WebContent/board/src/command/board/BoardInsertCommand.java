package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.BoardDao;
import dto.BoardDto;

public class BoardInsertCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String mId = request.getParameter("mId");
		String bIp = request.getRemoteAddr();
		
		BoardDto boardDto = new BoardDto();
		boardDto.setbTitle(bTitle);
		boardDto.setbContent(bContent);
		boardDto.setmId(mId);
		boardDto.setbIp(bIp);
		
		int result = BoardDao.getInstance().boardInsert(boardDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/boardInsertResult.jsp?result="+result);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}
