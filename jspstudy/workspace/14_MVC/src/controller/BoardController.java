package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.BoardCommand;
import command.Command;

@WebServlet("*.brd")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public BoardController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		Command command = null;
		switch (cmd) {
		case "/board.brd":
			command = new BoardCommand();
			break;

		}
		String path = command.execute(request, response);
		// 앞서 3개변수[제목, 작성자, 내용]가 이곳 path에 저장된다.
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
