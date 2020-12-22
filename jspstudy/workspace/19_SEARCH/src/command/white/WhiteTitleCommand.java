package command.white;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import common.Command;
import dao.WhiteDao;
import dto.WhiteDto;

public class WhiteTitleCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		String query = request.getParameter("query");
		List<WhiteDto>list = WhiteDao.getInstance().titleList(query);
		request.setAttribute("list", list);
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("white/listPage.jsp");
		pathNRedirect.setRedirect(false);
		return pathNRedirect;
	}

}
