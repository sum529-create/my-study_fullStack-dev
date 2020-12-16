package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//			 /*.do 가 아님에 주의
// Triangle 이든 Rectangle이든 모든 do는 다 여기로 오게 된다.
@WebServlet("*.do")	// suffix가 .do인 모든 요청을 처리하는 CONTROLLER
public class ShapeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShapeController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
