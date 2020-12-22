package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response);
}
