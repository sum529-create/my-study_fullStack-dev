package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.EnglishCommand;
import command.KoreanCommand;


@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getParameter("cmd");
		String path = null;
		Command command = null;
		switch (cmd) {
		case "korean":
			/* KoreanCommand command1 = new KoreanCommand(); */
			command = new KoreanCommand();
			path = command.execute(request, response);
			break;
		case "english":
			/* EnglishCommand command2 = new EnglishCommand(); */
			command = new EnglishCommand();
			path = command.execute(request, response);
			break;
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
