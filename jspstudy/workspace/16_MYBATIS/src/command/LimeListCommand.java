package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.LimeDao;
import dto.LimeDto;

public class LimeListCommand implements LimeCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		// dao에서 list를 가져온다.
		List<LimeDto> list = LimeDao.getInstance().list();
		request.setAttribute("list", list);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("lime/listPage.jsp");
		pathNRedirect.setRedirect(false); 	// forward 방식 (lime/listPage.jsp에 기존 request를 전달한다)
		
		return pathNRedirect;
	}

}
