package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GreenDao;
import dto.GreenDto;

public class GreenUpdateCommand implements GreenCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		GreenDto greenDto = new GreenDto();
		greenDto.setNo(no);
		greenDto.setTitle(title);
		greenDto.setContent(content);
		
		int result = GreenDao.getInstance().update(greenDto);
		request.setAttribute("result", result);
		request.setAttribute("no", no);
		
		return "/green/updateResult.jsp";
	}

}
