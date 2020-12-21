package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.BlackCommand;
import command.BlackJSONCommand;
import command.BlackStringCommand;
import common.PathNRedirect;

@WebServlet("*.black")
public class BlackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BlackController() {
        super();
    }
	
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		/* AJAX를 처리하는 Constroller는 PathNRedirect가 필요하지 않다. */
		// PathNRedirect pathNRedirect = null;
		
		/* AJAX는 실제 데이터를 String 타입으로 반환하므로 String result가 필요하다. */
		String result = null;
		
		BlackCommand command = null;
		
		switch (cmd) {
		
		case "/getString.black":
			command = new BlackStringCommand();
			result = command.execute(request, response);
			break;
		case "/getJSON.black":
			command = new BlackJSONCommand();
			result = command.execute(request, response);
			break;
		}
		
		/* AJAX를 처리하는 Constroller는 PathNRedirect가 필요하지 않다. */
		/*
		String path = pathNRedirect.getPath();
		boolean isRedirect = pathNRedirect.isRedirect();
		
		if (isRedirect) {
			response.sendRedirect(path);
		} else {
			request.getRequestDispatcher(path).forward(request, response);
		}
		*/
		
		// 반환 값(결과)을 요청한 곳으로 보내면 된다.
		// 응답
		PrintWriter out = response.getWriter();
		out.println(result);  // AJAX 통신이 성공하면 success: function(data) { ... }의 data로 result가 전달된다.
    	
	}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}