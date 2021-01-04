package command.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;

public interface ReplyCommand {

	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response)throws Exception;
}
