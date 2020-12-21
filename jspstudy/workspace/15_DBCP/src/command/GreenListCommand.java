package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GreenDao;
import dto.GreenDto;

public class GreenListCommand implements GreenCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		//  테이블의 전체 목록을 request에 저장해 두기
		
		ArrayList<GreenDto> list = GreenDao.getInstance().list();
		request.setAttribute("list", list);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("green/listPage.jsp");
		pathNRedirect.setRedirect(false); 	// forward 방식 request.setAttribute("list", list); 잘 전달된다. 
		return pathNRedirect;
	}

}
