package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.bbs.BBSCommand;
import command.bbs.BBSInsertCommand;
import command.bbs.BBSListCommand;
import command.bbs.BBSViewCommand;
import common.PathNRedirect;

@WebServlet("*.bbs")
public class BBSController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BBSController() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		
		BBSCommand command = null;
		
		try {
			switch (cmd) {
			// command 필요
			case "/bbsListPage.bbs":
				command = new BBSListCommand();
				pathNRedirect = command.execute(request, response);
				break;
			case "/bbsInsert.bbs":
				command = new BBSInsertCommand();
				pathNRedirect = command.execute(request, response);
				break;
			case "/bbsViewPage.bbs":
				command = new BBSViewCommand();
				pathNRedirect = command.execute(request, response);
				break;
			// 단순 이동
			case "/bbsInsertPage.bbs":
				pathNRedirect = new PathNRedirect();
				pathNRedirect.setPath("bbs/bbsInsertPage.jsp");
				pathNRedirect.setRedirect(false);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String path = pathNRedirect.getPath();
		boolean isRedirect = pathNRedirect.isRedirect();
		if (isRedirect) {
			response.sendRedirect(path);
		} else {
			request.getRequestDispatcher(path).forward(request, response);
		}
    
    }

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}