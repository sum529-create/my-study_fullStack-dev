package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.LimeDao;

public class LimeDeleteCommand implements LimeCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = LimeDao.getInstance().delete(no);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("lime/deleteResult.jsp?result="+result);
		pathNRedirect.setRedirect(true); 	// redirect
		
		return pathNRedirect;
	}

}
