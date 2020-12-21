package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.GreenCommand;
import command.GreenDeleteCommand;
import command.GreenInsertCommand;
import command.GreenListCommand;
import command.GreenUpdateCommand;
import command.GreenViewCommand;
import common.PathNRedirect;

@WebServlet("*.do")
public class GreenController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GreenController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		GreenCommand command = null;
		PathNRedirect pathNRedirect = null; 	// String path = null;
		
		switch(cmd) {
		// Command 필요 (DB, 로직)
		case "/listPage.do" :
			command = new GreenListCommand();
			pathNRedirect = command.execute(request, response);
			break;
			
		case "/insert.do":
			command = new GreenInsertCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/viewPage.do":
			command = new GreenViewCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/delete.do":
			command = new GreenDeleteCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/update.do":
			command = new GreenUpdateCommand();
			pathNRedirect = command.execute(request, response);
			break;
			// 단순 이동
		case "/insertPage.do":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("green/insertPage.jsp");
			pathNRedirect.setRedirect(true);
			break;
		case "/updatePage.do":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("green/insertPage.jsp");  
			pathNRedirect.setRedirect(false);	// forward 삽입시에는 false, select시 true
			break;
			
			/** 폴더 앞 '/'(슬래시) 유무? **/
			
			// '/'  redirect는 전체 경로를 찾는 것이기 때문에 /(슬래시)로 시작하면 /green이 contextPath인 줄 안다.
			// pathNRedirect.setPath("/green/insertPage.jsp");  
			// 위 방법은 http://localhost:9090/green/insertPage.jsp 로 이동하게 됩니다.
			
			// ''   시작이 슬래시(/)가 아니면 폴더로 인식됩니다.
			// pathNRedirect.setPath("green/insertPage.jsp");
			// 위 방법은 http://localhost:9090/15_DBCP/green/insertPage.jsp  로 이동하게 됩니다.
			
		}
		
		// redirect를 사용할 건지 forward를 사용할것인지
		String path = pathNRedirect.getPath();
		if(pathNRedirect.isRedirect()) {
			response.sendRedirect(path);
		}else {
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
