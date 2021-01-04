
package command.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface BBSCommand {

	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}