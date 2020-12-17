package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GreenDao;
import dto.GreenDto;

public class GreenViewCommand implements GreenCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		String strNo = request.getParameter("no");
		int no = 0;
		if(strNo != null && !strNo.isEmpty()) {
			no = Integer.parseInt(strNo);
		}
		
		GreenDao.getInstance().updateHit(no);	// 조회수 증가 결과는 처리하지 않음
		GreenDto greenDto = GreenDao.getInstance().view(no);
		boolean result = false;
		if(greenDto != null) {
			result = true;
		}
		// boolean result = (greenDto != null);
		PathNRedirect pathNRedirect = new PathNRedirect();
		if(result) {	// result가 true이므로 성공
			request.setAttribute("greenDto", greenDto);
			pathNRedirect.setPath("green/viewPage.jsp");
			pathNRedirect.setRedirect(false); 	// forward   생략가능
		}else { // 실패
			pathNRedirect.setPath("green/viewFail.jsp");
			pathNRedirect.setRedirect(false); 	// forward   생략가능
		}
		/* 만약 setRedirect를 생략하면 
		 * 기본값인 false인 forward방식이 된다.*/
		
		return pathNRedirect;
	}

}
