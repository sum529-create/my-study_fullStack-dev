package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GreenDao;
import dto.GreenDto;

public class GreenListCommand implements GreenCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//  테이블의 전체 목록을 request에 저장해 두기
		
		ArrayList<GreenDto> list = GreenDao.getInstance().list();
		request.setAttribute("list", list);
		
		return "green/listPage.jsp";
	}

}
