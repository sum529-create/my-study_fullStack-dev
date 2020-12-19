package ex03;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01_B")
public class Ex01_B extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex01_B() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request는 인코딩부터 합시다.
		request.setCharacterEncoding("UTF-8");
		
		// request로 전달된 파라미터
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
	
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>request</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>이름: " + name  + "</h3>");
		out.println("<h3>나이: " + age  + "</h3>");
		
		// 이름과 나이를 다시 Ex01_C.java 서블릿 파일로 보내고 싶다.
		out.println("<h3><a href=\"\\01_SERVLET\\Ex01_C?name=" + name + "&age=" + age + "\">이동</a></h3>");
		// out.println("<a href=\"/01_SERVLET/Ex01_C\">이동</a>");		// html파일에서 작성한 코드를 붙여넣으면 자동으로 변환되어 출력됨 \" 이런거
		
		out.println("</body>");
		out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
