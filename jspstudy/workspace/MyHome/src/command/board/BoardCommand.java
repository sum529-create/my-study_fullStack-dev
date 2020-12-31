package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface BoardCommand {

	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}