package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.ScoreCommand;

@WebServlet("*.score")
public class ScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ScoreController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		/*
		 * 	request : /14_MVC/process.score
		 * 	contextPath : /14_MVC
		 *  requestURI.subString(context.length)
		 */
		Command command = null;
		switch (cmd) {
		case "/process.score":
			command = new ScoreCommand();
			break;
		}
		String path = command.execute(request, response);
		// return "view/scoreOutput.jsp"; 이 들어감 경로
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
