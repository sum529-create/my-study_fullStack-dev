package command.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GuestDao;
import dto.GuestDto;

public class GuestViewCommand implements GuestCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		String strgNo = request.getParameter("gNo");
		int gNo = 0;
		if(strgNo != null || !strgNo.isEmpty()) {
			gNo = Integer.parseInt(strgNo);
		}
		
		GuestDto guestDto = GuestDao.getInstance().selectBygNo(gNo);
		
		request.setAttribute("guestDto", guestDto);
		request.setAttribute("result", guestDto != null); // true or false 값 저장
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("guest/guestViewResult.jsp");
		pathNRedirect.setRedirect(false);	// forward
		return pathNRedirect;
	}

}
