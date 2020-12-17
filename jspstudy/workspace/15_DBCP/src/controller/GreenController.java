package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.GreenCommand;
import command.GreenInsertCommand;
import command.GreenListCommand;

@WebServlet("*.do")
public class GreenController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GreenController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		GreenCommand command = null;
		String path = null;
		
		switch(cmd) {
		// Command 필요 (DB, 로직)
		case "/listPage.do" :
			command = new GreenListCommand();
			path = command.execute(request, response);
			break;
			
		// 단순 이동
		case "/insertPage.do":
			path = "green/insertPage.jsp";
			break;
			
		case "/insert.do":
			command = new GreenInsertCommand();
			path = command.execute(request, response);
			break;
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
