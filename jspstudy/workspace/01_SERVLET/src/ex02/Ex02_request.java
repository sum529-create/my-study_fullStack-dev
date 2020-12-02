package ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex02_request
 */
@WebServlet("/Ex02_request")
public class Ex02_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex02_request() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request 객체의 기본 정보 살펴보기
		String ip = request.getRemoteAddr();			// 요청한 사람의 IP주소 (중요)
		String contextPath = request.getContextPath();	// 컨텍스트패스 알아내기 (중요) == 패키지 이름
		String charset = request.getCharacterEncoding();// 인코딩 알아내기
		String contentType = request.getContentType();	// 컨텐트 타입 알아내기
		String method = request.getMethod();			// form 태그의 post와 get를 의미, 전송타입(GET, POST) 알아내기
		
		// response 생성
		// 1. content-type, charset
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// 2. 출력 스르림 생성
		PrintWriter out = response.getWriter();
		
		// 3. 출력할 내용 만들기
		out.println("<!DOCTYPE html>");		// html5
		out.println("<head>");
		out.println("<title>제목</title>");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
