package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.LimeDao;
import dto.LimeDto;

public class LimeUpdateCommand implements LimeCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		LimeDto limeDto = new LimeDto();
		limeDto.setNo(no);
		limeDto.setTitle(title);
		limeDto.setContent(content);
		
		int result = LimeDao.getInstance().update(limeDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("lime/updateResult.jsp?result=" + result + "&no=" + no);
		pathNRedirect.setRedirect(true);  // redirect
		
		return pathNRedirect;
	}

}
