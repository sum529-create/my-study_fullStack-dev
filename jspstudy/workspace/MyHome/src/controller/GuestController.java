package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.guest.DownloadCommand;
import command.guest.GuestCommand;
import command.guest.GuestDeleteCommand;
import command.guest.GuestDeleteFileCommand;
import command.guest.GuestInsertCommand;
import command.guest.GuestListCommand;
import command.guest.GuestViewCommand;
import command.member.MemberCommand;
import command.member.MemberLoginCommand;
import command.member.MemberLogoutCommand;
import common.PathNRedirect;

@WebServlet("*.guest")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GuestController() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		
		GuestCommand command = null;
		
		switch (cmd) {
		// command 필요
		case "/guestListPage.guest":
			command = new GuestListCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/guestInsert.guest":
			command = new GuestInsertCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/download.guest":
			DownloadCommand.download(request, response);
			break;
		case "/guestViewPage.guest":
			command = new GuestViewCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/guestDeleteFile.guest":
			command = new GuestDeleteFileCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/guestDelete.guest":
			command = new GuestDeleteCommand();
			pathNRedirect = command.execute(request, response);
			break;
		// 단순이동
		case "/guestInsertPage.guest":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("guest/guestInsertPage.jsp");
			pathNRedirect.setRedirect(false);
			break;
		case "/guestDeletePage.guest":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("guest/guestDeletePage.jsp");
			pathNRedirect.setRedirect(false);
			break;
		case "/guestUpdatePage.guest":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("guest/guestUpdatePage.jsp");
			pathNRedirect.setRedirect(false);
			break;
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