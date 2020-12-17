package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GreenDao;

public class GreenDeleteCommand implements GreenCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = GreenDao.getInstance().delete(no);
		request.setAttribute("result", result);
		
		return "/green/deleteResult.jsp";
	}

}
