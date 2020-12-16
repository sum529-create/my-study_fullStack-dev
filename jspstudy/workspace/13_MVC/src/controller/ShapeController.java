package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.RectangleCommand;
import command.TriangleCommand;
//			 /*.do 가 아님에 주의
// Triangle 이든 Rectangle이든 모든 do는 다 여기로 오게 된다.
@WebServlet("*.do")	// suffix가 .do인 모든 요청을 처리하는 CONTROLLER
public class ShapeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShapeController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// request로 width와 height가 넘어왔다.
		// JSP의 요청을 확인한다. (triangle.do인지 rectangle.do인지 확인한다)
		// 1. 전체 요청 URI를 확인한다.		// contextPath/*.do
		// 2. 컨텍스트패스를 확인하다.		// contextPath
		// 3. 1에서 2를 뺀다.				// *.do
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		// String requestURI = "/13_MVC/triangle.do";
		// String contextPath = "/13_MVC";
		// String cmd = requestURI.substring(7);	// 7번 인덱스부터[0부터 '/'위치부터] => triangle.do
		//									아래 '/'를 빼고 싶다면 "+1"
		String path = null;
		Command command = null;
		switch (cmd) {
		case "/triangle.do":
			command = new TriangleCommand();
			path = command.execute(request, response);
			break;
		case "/rectangle.do":
			command = new RectangleCommand();
			path = command.execute(request, response);
			break;
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
