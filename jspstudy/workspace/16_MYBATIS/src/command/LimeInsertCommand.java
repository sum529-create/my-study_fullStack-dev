package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.LimeDao;
import dto.LimeDto;

public class LimeInsertCommand implements LimeCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		LimeDto limeDto = new LimeDto();
		limeDto.setWriter(writer);
		limeDto.setTitle(title);
		limeDto.setContent(content);
		
		int result = LimeDao.getInstance().insert(limeDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("lime/insertResult.jsp?result=" + result); // result = 1
		pathNRedirect.setRedirect(true);  // redirect
		
		return pathNRedirect;
	}

}
