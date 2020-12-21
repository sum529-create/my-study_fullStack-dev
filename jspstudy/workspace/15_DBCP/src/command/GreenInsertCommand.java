package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GreenDao;
import dto.GreenDto;

public class GreenInsertCommand implements GreenCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		// 어디로 가야하나? -> 원래는 listPage.jsp로 갔었으나 자바 코드가 없이 사용했기에
		// (list선언코드 없음) empty list가 된다.
		// insert 결과 페이지를 하나 만든다. (패턴을 지키기위한 노력[Controller])
		
		// DB에 삽입 후 결과를 request에 저장
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		GreenDto greenDto = new GreenDto();
		greenDto.setWriter(writer);
		greenDto.setTitle(title);
		greenDto.setContent(content);
		
		// hit는 0으로 날짜는 sysdate로 줄거기에 따로 선언은 하지않는다.
		int result = GreenDao.getInstance().insert(greenDto);

		PathNRedirect pathNRedirect = new PathNRedirect();
		if(result > 0) {	// 삽입이 성공하면
			pathNRedirect.setPath("green/insertResult.jsp?result=1" + result);	
			// redirect도 새로운 request는 전달된다.
			pathNRedirect.setRedirect(true); 		// redirect (기존 request를 넘기지 않는다.)
		}
		// request.setAttribute("result", result); 넘어가지 않아 필요가 없다.
		// redirect 시 기존 setAttribute는 필요없다.
		return pathNRedirect;
	}

}
