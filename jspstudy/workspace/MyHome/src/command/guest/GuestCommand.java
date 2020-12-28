package command.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface GuestCommand {
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response);
}
