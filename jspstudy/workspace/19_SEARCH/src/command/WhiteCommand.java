package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface WhiteCommand {
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response);
}
