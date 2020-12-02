package ex03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex02_C")
public class Ex02_C extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex02_C() {
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
		out.println("<h3>다시받은이름: " + name  + "</h3>");
		out.println("<h3>다시받은 나이: " + age  + "</h3>");
		out.println("</body>");
		out.println("</html>");
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
