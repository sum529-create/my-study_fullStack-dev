package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.LimeDao;
import dto.LimeDto;

public class LimeViewCommand implements LimeCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		
		LimeDto limeDto = LimeDao.getInstance().view(no);
		
		request.setAttribute("limeDto", limeDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("/lime/viewPage.jsp");
		pathNRedirect.setRedirect(false); 	// forward 방식 (limeDto를 넘겨 주기 위해서)
		return pathNRedirect;
	}

}
