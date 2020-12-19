package ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex07_form")
public class Ex07_form extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex07_form() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request에서 파라미터 꺼내기
		request.setCharacterEncoding("UTF-8");
		
		// radio는 하나의 value만 전송된다.
		String choice = request.getParameter("choice");
		
		// checkbox는 여러 value가 전송됩니다. 배열을 준비합니다.
		String[] interest = request.getParameterValues("interest");
		
		// <select> 태그는 기본적으로 하나의 value만 전송됩니다.
		String alpha  = request.getParameter("alpha");
		
		// <select multiple>태그는 여러 option의 선택이 가능하므로
		// 여러 value가 전송됩니다. 배열을 준비합니다.
		String[] hangul = request.getParameterValues("hangul");
		
		// <input>태그와 <datalist>태그는 <input>태그처럼 처리합니다.
		// <datalist>태그를 따로 보내지 않습니다.
		String roman = request.getParameter("roman");
		
		// 같은 name을 가진 서로 다른 태그가 존재하는 경우
		// 서버에서는 배열로 인식됩니다.
		String[] address = request.getParameterValues("address");
		
		// hidden은 서버로 데이터를 보내는 것이 목적이므로 잊지말고 저장해 둘것
		String invisible = request.getParameter("invisible");
		
		// 하나의 value만 보냅니다.
		String memo = request.getParameter("memo");
		
		
		// request 처리하기
				request.setCharacterEncoding("UTF-8");

				
				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				
				// 출력할 내용 생성
				out.println("<!DOCTYPE html>");		// html5
				out.println("<head>");
				out.println("<title>제목</title>");
				out.println("</head>");
				out.println("<body>");
				out.println("<h3>선택: "+ choice + "</h3>");
				out.println("<h3>관심사: ");
				for(String i : interest) {
					out.println(i + " ");
				}
				out.println("</h3>");
				out.println("<h3>영문: "+ alpha + "</h3>");
				out.println("<h3>한글: "+ Arrays.toString(hangul) + "</h3>");
				out.println("<h3>로마: "+ roman + "</h3>");
				String fullAddr = address[0] + " " + address[1];
				out.println("<h3>주소: "+ fullAddr + "</h3>");
				out.println("<h3>히든: "+ invisible + "</h3>");
				out.println("<h3>textarea: <br/><pre>"+ memo + "</pre></h3>");
				out.println("</body>");
				out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
