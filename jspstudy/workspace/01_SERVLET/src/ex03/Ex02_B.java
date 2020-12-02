package ex03;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex02_B")
public class Ex02_B extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex02_B() {
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
		out.println("<script>");
		out.println("location.href = '/01_SERVLET/Ex02_C?name=" + name + "&age=" + age + "'");
		out.println("</script>");
		out.println("</head>");
		out.println("<body>");
		out.println("</body>");
		out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
