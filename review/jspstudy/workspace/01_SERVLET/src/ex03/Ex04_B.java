package ex03;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex04_B")
public class Ex04_B extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ex04_B() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * forward
		 * A -> B -> C
		 * 
		 * redirect 
		 * A (-> B -> A ) -> C
		 * - A에서 C로 바로 넘기는 것이 없다. B->A response 전송, 답을 준 request는 종료된다. 동일한 것을 쓰려면 다시 물어봐야한다.
		 *  
		 */
		
		// 다른 페이지로 이동할 때 redirect를 이용할 수 있습니다.
		// redirect로 이동하면 내가 보낸 request 정보가 유지되지 않습니다.
		
		
		// 서버 내 이동이 아닙니다.
		// redirect는 사용자에게 이동할 장소를 response(응답)해 주는 방식으로 이동합니다.
		
		response.sendRedirect("/01_SERVLET/Ex04_C"); 	// 이동할 경로는 사용자가 이동할 수 있도록 전체경로(contextpath/URLMapping)를 작성해 줘야한다.
		/*
		 * 다시받은이름: null
		 * 다시받은 나이: null
		 * 
		 * => 값을 찾아가 C경로로 이동하지만 값이 넘어오지 않는다.
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
