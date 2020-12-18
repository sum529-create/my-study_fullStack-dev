package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.LimeCommand;
import command.LimeDeleteCommand;
import command.LimeInsertCommand;
import command.LimeListCommand;
import command.LimeUpdateCommand;
import command.LimeViewCommand;
import common.PathNRedirect;


@WebServlet("*.lime")
public class LimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LimeController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		LimeCommand command = null;
		switch(cmd) {
		// Command 필요
		case "/listPage.lime":
			command = new LimeListCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/insert.lime":
			command = new LimeInsertCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/viewPage.lime":
			command = new LimeViewCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/delete.lime":
			command = new LimeDeleteCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/update.lime":
			command = new LimeUpdateCommand();
			pathNRedirect = command.execute(request, response);
			break;
			// 단순이동
		case "/insertPage.lime":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("lime/insertPage.jsp");
			pathNRedirect.setRedirect(false); // forward
			// forward : http://localhost:9090/16_MYBATIS/insertPage.lime
			// redirect : http://localhost:9090/16_MYBATIS/lime/insertPage.lime
			// 처음부터 다시 찾아가서 가는 방식이기네 lime이 붙는다.
			break;
		case "/updatePage.lime":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("lime/updatePage.jsp");
			pathNRedirect.setRedirect(false); // forward
			break;
		}
		String path = pathNRedirect.getPath();
		boolean isRedirect = pathNRedirect.isRedirect();
		if(isRedirect){
			response.sendRedirect(path);
			
		}else {
			request.getRequestDispatcher(path).forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
