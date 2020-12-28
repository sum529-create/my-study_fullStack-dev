package command.guest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GuestDao;
import dto.GuestDto;

public class GuestListCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		List<GuestDto> list = GuestDao.getInstance().selectGuestList();
		request.setAttribute("list", list);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("guest/guestListPage.jsp");
		pathNRedirect.setRedirect(false);	// list에 담았다. forward해야함
		return pathNRedirect;
	}

}
