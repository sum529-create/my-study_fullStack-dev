package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Gugudan;


@WebServlet("/GugudanController")
public class GugudanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GugudanController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request에 start와 end값이 들어가 있다.
		// 그래서 자바 클래스에 저장될 수 있다.
		request.setCharacterEncoding("UTF-8");
		Gugudan gugudan = new Gugudan();
		String path = gugudan.execute(request, response);
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
