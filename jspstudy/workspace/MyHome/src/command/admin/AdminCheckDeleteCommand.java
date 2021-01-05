package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.AdminDao;
import dto.MemberDto;

public class AdminCheckDeleteCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String target = request.getParameter("target");

		String page = request.getParameter("page");

		String[] mNoList = target.split(",");
		String[] mIdList = new String[mNoList.length];
		for(int i = 0; i<mNoList.length; i++) {
			// 각 회원번호: mNoList[i]
			int mNo = Integer.parseInt(mNoList[i]);
			MemberDto memberDto = AdminDao.getInstance().selectMemberBymNo(mNo);
			mIdList[i] = memberDto.getmId();
		}
		
		int result = 0;
		for(int i = 0; i<mNoList.length; i++) {
			AdminDao.getInstance().adminMemberBoardDelete(mIdList[i]);
			int mNo = Integer.parseInt(mNoList[i]);
			result += AdminDao.getInstance().adminMemberDelete(mNo);
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("admin/adminMemberDeleteResult.jsp?result=" + (result == mNoList.length) + "&page=" + page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}
