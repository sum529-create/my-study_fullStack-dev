package command.white;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import common.Command;
import dao.WhiteDao;
import dto.WhiteDto;

public class WhiteListCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		List<WhiteDto> list = WhiteDao.getInstance().list();
		request.setAttribute("list", list);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("white/listPage.jsp");
		pathNRedirect.setRedirect(false); 	// list값을 넘겨주기 위해서 기존 request를 유지해야 하므로 forward
		return pathNRedirect;
	}

}
