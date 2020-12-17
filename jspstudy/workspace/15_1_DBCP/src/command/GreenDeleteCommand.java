package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GreenDao;

public class GreenDeleteCommand implements GreenCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = GreenDao.getInstance().delete(no);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		if(result > 0) {	// 삭제가 성공했을 떄
			pathNRedirect.setPath("green/deleteSuccess.jsp");
			pathNRedirect.setRedirect(true);	// redirect
		}else {				// 삭제가 실패했을 때
			pathNRedirect.setPath("green/deleteFail.jsp");
			pathNRedirect.setRedirect(false);	// forward
		}
		/* return /green/deleteResult.jsp; */
		return pathNRedirect;
	}

}
