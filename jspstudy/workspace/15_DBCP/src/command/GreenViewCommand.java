package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GreenDao;
import dto.GreenDto;

public class GreenViewCommand implements GreenCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String strNo = request.getParameter("no");
		int no = 0;
		if(strNo != null && !strNo.isEmpty()) {
			no = Integer.parseInt(strNo);
		}
		
		GreenDao.getInstance().updateHit(no);	// 조회수 증가 결과는 처리하지 않음
		GreenDto greenDto = GreenDao.getInstance().view(no);
		
		request.setAttribute("greenDto", greenDto);
		
		return "green/viewPage.jsp";
	}

}
