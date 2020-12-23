package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface MemberCommand {
	public PathNRedirect exequte(HttpServletRequest request, HttpServletResponse response);
}
