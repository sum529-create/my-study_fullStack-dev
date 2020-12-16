package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Today;


@WebServlet("/DateController")
public class DateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// CONTROLLER
		// 1. 요청을 확인하고, 요청을 처리한 Model(Command)을 호출한다. -> Today.java
		// 2. Model(Command)이 반환한 결과와 응답VIEW를 이용해서 페이지 이동(응답)을 한다.
		
		// 모델을 만든다. 모델이 없으면 요청을 처리할 수 없다.
		
		
		Today today = new Today();
		String path = today.execute(request, response);
		
		// path로 이동하는 방법
		// Today Command가 request에 result를 저장해 두었으므로
		// 이를 전달하기 위해서 forward한다.
		// "request.setAttribute("result", result);" <- 요 부분에서 전달했으니 forward로 받음
		request.getRequestDispatcher(path).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
