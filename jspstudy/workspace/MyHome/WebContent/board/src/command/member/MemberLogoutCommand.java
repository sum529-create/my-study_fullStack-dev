package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;

public class MemberLogoutCommand implements MemberCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		// 로그아웃은 session을 비워주면 됩니다.
		HttpSession session = request.getSession();
		if(session.getAttribute("loginDto")!= null) {
			session.invalidate();
		}
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("index.jsp");
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}
