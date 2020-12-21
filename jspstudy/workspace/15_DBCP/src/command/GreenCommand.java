package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface GreenCommand {
	
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response);
	// public String execute(HttpServletRequest request, HttpServletResponse response);
}
