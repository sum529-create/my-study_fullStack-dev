package command.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public class BBSListCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("bbs/bbsListPage.jsp");
		pathNRedirect.setRedirect(false);
		return pathNRedirect;
	}

}
