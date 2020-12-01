package ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex02_servlet
 * 
 * 서블릿을 실행하는 방법
 * 
 * 1. 톰캣을 실행한다.
 * 2. URL을 아래와 같이 입력한다.
 * 		1) 호스트명:포트번호/컨텍스트패스/URLMapping 
 * 							컨텍스트루트/URLPattern
 * 		2) 디폴트
 * 			호스트명:포트번호/프로젝트이름/서블릿이름
 * 3. 컨텍스트패스 바꾸는 방법
 * 		1) 프로젝트 생성 단계에서 Context root를 바꾼다.
 * 		2) 완성된 프로젝트의 속성에서 Context root를 바꾼다.
 * 			: 프로젝트 우클릭 - Properties - Web Project Settings
 * 4. URLMapping 바꾸는 방법
 * 		1) 서블릿 생성 단계에서 URL Mapping을 바꾼다.
 * 		2) 완성된 서블릿의 애너테이션 @WebServlet() 값을 바꾼다. 
 * 		3) web.xml 에서 변경한다.
 * 		<servlet>
 * 			<servlet-name>MyServlet</servlet-name>
 * 			<servlet-class>ex01.Ex02_servlet</servlet-class>
 * 		</servlet>
 * 		<servlet-mapping>
 * 			<servlet-name>MyServlet</servlet-name>
 * 			<url-pattern>/Ex02</url-pattern>
 * 		</servlet-mapping>
 * 
 */
@WebServlet("/Ex02_servlet")		// 이게 URL Mapping 값입니다.
public class Ex02_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ex02_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
