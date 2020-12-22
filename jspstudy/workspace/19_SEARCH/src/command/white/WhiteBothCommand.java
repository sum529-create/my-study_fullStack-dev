package command.white;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import common.Command;
import dao.WhiteDao;

public class WhiteBothCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		// Command에서 만능문자(%)를 미리 처리해두면
		// mapper에서는 표준 SQL에 가까운 쿼리문의 작성이 가능하다.
		String query = "%" + request.getParameter("query") + "%";
		
		request.setAttribute("list", WhiteDao.getInstance().bothList(query));
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("white/listPage.jsp");
		pathNRedirect.setRedirect(false);
		return null;
	}

}
