package ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex02_request")
public class Ex02_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Ex02_request() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ip = request.getRemoteAddr();
		String contextPath = request.getContextPath();
		String charset = request.getCharacterEncoding();
		String contentType = request.getContentType();
		String method = request.getMethod();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Á¦¸ñ</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>IP: "+ ip + "</h3>");
		out.println("<h3>ContextPath: "+ contextPath + "</h3>");
		out.println("<h3>Charset:"+ charset + "</h3>");
		out.println("<h3>ContentType: "+ contentType + "</h3>");
		out.println("<h3>Method: "+ method + "</h3>");
		out.println("</body>");
		out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
