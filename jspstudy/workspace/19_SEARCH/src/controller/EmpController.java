package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.emp.SearchAllCommand;
import command.emp.SearchDeptCommand;
import command.emp.SearchDynamicCommand;
import common.Command;
import common.PathNRedirect;

@WebServlet("*.emp")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmpController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		Command command = null;
		
		switch (cmd) {
		case "/listPage.emp":
			command = new SearchAllCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/searchDept.emp":
			command = new SearchDeptCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/searchDynamic.emp":
			command = new SearchDynamicCommand();
			pathNRedirect = command.execute(request, response);
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
