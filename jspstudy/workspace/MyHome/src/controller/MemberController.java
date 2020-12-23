package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.MemberCommand;
import command.member.MemberLoginCommand;
import command.member.MemberLogoutCommand;
import common.PathNRedirect;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberController() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		
		MemberCommand command = null;
		
		switch (cmd) {
		// command 필요
		case "/login.member":
			command = new MemberLoginCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/logout.member":
			command = new MemberLogoutCommand();
			pathNRedirect = command.execute(request, response);
			break;
		/*case "/findId.member":
			command = new MemberFindIdCommand();
			pathNRedirect = command.execute(request, response);
			break;*/
		
		// 단순 이동
		case "/index.member":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("index.jsp");
			break;
		case "/loginPage.member":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("member/loginPage.jsp");
			break;
		case "/findIdPage.member":
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("member/findIdPage.jsp");
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