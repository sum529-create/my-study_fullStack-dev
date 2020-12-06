package ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Quiz02
 */
@WebServlet("/Quiz02")
public class Quiz02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quiz02() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		String location = request.getParameter("location");
		String[] jobs	= request.getParameterValues("jobs");
		String memo = request.getParameter("memo");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>request</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<ul>");
		out.println("<li>아이디: " + id  + "</li>");
		out.println("<li>비밀번호: " + pwd  + "</li>");
		out.println("<li>성별: " + gender + "</li>");
		out.println("<li>취미: "+ Arrays.toString(hobby) +"</li>");
		out.println("<li>주소: " + location  + "</li>");
		out.println("<li>직업: "+ Arrays.toString(jobs) +"</li>");
		out.println("<li>메모: " + memo  + "</li><br/>");
		out.println("<li>키: " + height  + "</li>");
		out.println("<li>몸무게: " + weight  + "</li>");
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
