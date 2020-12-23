package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.MemberDao;
import dto.MemberDto;

public class MemberFindIdCommand implements MemberCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		String mEmail = request.getParameter("mEmail");
		
		MemberDto memberDto = MemberDao.getInstance().selectBymEmail(mEmail);
		if(memberDto == null) {
			request.setAttribute("foundId", "no");
		}else {
			request.setAttribute("foundId", memberDto.getmId());
		}
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("member/findIdResult.jsp");
		pathNRedirect.setRedirect(false);
		
		return pathNRedirect;
	}

}
