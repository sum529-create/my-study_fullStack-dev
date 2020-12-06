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
 * Servlet implementation class Ex07_form
 */
@WebServlet("/Ex07_form")
public class Ex07_form extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex07_form() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String check = request.getParameter("check");
		String[] hobby = request.getParameterValues("hobby");
		String alpha = request.getParameter("alpha");
		String[] hangul = request.getParameterValues("hangul");
		String list = request.getParameter("list");
		String[] address = request.getParameterValues("address");
		String invisible = request.getParameter("invisible");
		String memo = request.getParameter("memo");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");		// html5
		out.println("<head>");
		out.println("<title>제목</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>선택: "+ check + "</h3>");
		out.println("<h3>관심사: ");
		for(String i : hobby) {
			out.println(i + " ");
		}
		out.println("</h3>");
		out.println("<h3>영문: "+ alpha + "</h3>");
		out.println("<h3>한글: "+ Arrays.toString(hangul) + "</h3>");
		out.println("<h3>로마: "+ list + "</h3>");
		String fullAddr = address[0] + " " + address[1];
		out.println("<h3>주소: "+ fullAddr + "</h3>");
		out.println("<h3>히든: "+ invisible + "</h3>");
		out.println("<h3>textarea: <br/><pre>"+ memo + "</pre></h3>");
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
