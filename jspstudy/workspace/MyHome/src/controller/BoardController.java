package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.bbs.BBSDeleteCommand;
import command.bbs.BBSInsertCommand;
import command.bbs.BBSListCommand;
import command.bbs.BBSUpdateCommand;
import command.bbs.BBSViewCommand;
import command.board.BoardCommand;
import command.board.BoardDeleteCommand;
import command.board.BoardInsertCommand;
import command.board.BoardListCommand;
import command.board.BoardViewCommand;
import command.board.ReplyInsertCommand;
import common.PathNRedirect;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BoardController() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		
		BoardCommand command = null;
		
		try {
			switch (cmd) {
			// command 필요
			case "/boardListPage.board":
				command = new BoardListCommand();
				pathNRedirect = command.execute(request, response);
				break;
			case "/boardInsert.board":
				command = new BoardInsertCommand();
				pathNRedirect = command.execute(request, response);
				break;
			case "/boardViewPage.board":
				command = new BoardViewCommand();
				pathNRedirect = command.execute(request, response);
				break;
			case "/boardDelete.board":
				command = new BoardDeleteCommand();
				pathNRedirect = command.execute(request, response);
				break;
			case "/replyInsert.board":
				command = new ReplyInsertCommand(); // board 용 reply는 x
				pathNRedirect = command.execute(request, response);
				break;
			// 단순 이동
			case "/boardInsertPage.board":
				pathNRedirect = new PathNRedirect();
				pathNRedirect.setPath("board/boardInsertPage.jsp");
				pathNRedirect.setRedirect(false);
				break;
			case "/replyInsertPage.board":
				pathNRedirect = new PathNRedirect();
				pathNRedirect.setPath("board//replyInsertPage.jsp");
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