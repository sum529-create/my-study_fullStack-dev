package command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Today {
	
	// MODEL
	/* 1. CONTROLLER에게 결과와 응답할 VIEW를 반환한다. 
	 * (자바는 한개밖에 반환을 못한다. 그래서 ↓)
	 *		1) 반환값은 응답VIEW이다.
	 *		2) 결과값은 request에 저장한다.
	 * 2. 매개변수로 HttpServletRequest 클래스 타입의 request도 필요하다.
	 * (왜 매개변수? JSP에서 요청할 때 request에 담아서 클래스에게도
	 *   저장해야함으로 new가 아닌 매개변수를 선언해야한다.)
	 * 3. 매개변수로 HttpServletResponse 클래스 타입의 response도 필요할 수 있다.
	 */
	
	// 반환값을 응답VIEW이기에 String
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 현재날짜를 구해서 request에 저장하기
		Date result = new Date(System.currentTimeMillis());
		request.setAttribute("result", result);
		
		// 2. 결과를 보여 줄 VIEW이름을 반환하기
		// view 폴더에 결과를 몰아준다.
		return "view/today.jsp";
		
	}
}
