package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.LimeCommand;
import command.LimeListCommand;
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
