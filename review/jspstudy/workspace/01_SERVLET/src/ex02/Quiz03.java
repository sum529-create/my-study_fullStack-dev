package ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz03")
public class Quiz03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Quiz03() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		int kor = 0;
		int mat = 0;
		int eng = 0;
		String strKor = request.getParameter("kor");
		String strEng = request.getParameter("eng");
		String strMat = request.getParameter("mat");
		if ( strKor != null && !strKor.isEmpty()) {
			kor = Integer.parseInt(request.getParameter("kor"));
		}
		if ( strEng != null && !strEng.isEmpty()) {
			eng = Integer.parseInt(request.getParameter("eng"));
		}
		if ( strMat != null && !strMat.isEmpty()) {
			mat = Integer.parseInt(request.getParameter("mat"));
		}
		
		double lavg = Double.parseDouble(request.getParameter("lavg"));
		
		
		double avg = (double) ((kor + eng + mat)/3.0);
		
		double diff = avg - lavg;
		
		char grade = avg >= 90 ? 'A' : avg>=80 ? 'B' : avg>=70 ? 'C' : avg>=60 ? 'D' : 'F';
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>제목</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>"+ name +"의 평균은 " + avg + "점이고, 학점은 " + grade + "학점이다.<br/>"
				+ "지난 시험의 평균은 " + lavg + "점으로 이번 평균과 " + diff + "점의 차이가 있다."  +"</h3>");
		out.println("</body>");
		out.println("</html>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
