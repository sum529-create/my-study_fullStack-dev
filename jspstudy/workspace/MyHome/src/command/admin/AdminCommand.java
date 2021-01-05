package command.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface AdminCommand {

	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}