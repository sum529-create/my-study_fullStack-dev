package ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Quiz
 * 
 * localhost:9090/01_SERVLET/korea 를 입력하면
 * Quiz가 실행되도록 설정하시오.
 * 
 */

@WebServlet("/korea")
public class Quiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Quiz() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
