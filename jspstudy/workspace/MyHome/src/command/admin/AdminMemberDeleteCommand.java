package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.AdminDao;

public class AdminMemberDeleteCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String page = request.getParameter("page");

		String strmNo = request.getParameter("mNo");
		int mNo = 0;
		if(strmNo != null && !strmNo.isEmpty()) {
			mNo = Integer.parseInt(strmNo);
		}
		
		/*
		String strmNo = request.getParameter("mNo");
		if (strmNo == null || strmNo.isEmpty()) {
			strmNo = "0";
		}
		int mNo = Integer.parseInt(strmNo);
		*/
		
		String mId = request.getParameter("mId");
		AdminDao.getInstance().adminMemberBoardDelete(mId);
		int result = AdminDao.getInstance().adminMemberDelete(mNo);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("admin/adminMemberDeleteResult.jsp?result="+result + "&page=" + page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}
