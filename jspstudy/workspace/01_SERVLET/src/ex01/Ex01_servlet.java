package ex01;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex01_servlet
 */
@WebServlet("/Ex01_servlet")
public class Ex01_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     * 
     * 1. 생성자
     * 		생성자 호출 뒤 init() 메소드가 호출된다.
     * 
     */
    public Ex01_servlet() {
        System.out.println("생성자 호출");
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 * 
	 * 2. init() 메소드
	 * 		1) 최초 한 번만 호출된다.
	 * 		2) 초기화 용도로 사용할 수 있다.
	 * 		3) init() 호출 뒤 service()메소드가 호출된다.
	 * 
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 * 3. service() 메소드
	 * 		1) 실제 처리를 할 수 있다.
	 * 															(response 사용자(client)로부터 데이터를 받아 보내줄수있다.)
	 * 		HttpServletRequest request, HttpServletResponse response
	 * 							request(client 요청[submit하면 이 쪽으로 이동한다.], 메소드 정보가 들어가있다.)
	 * 
	 * 		2) 매개변수-1
	 * 			(1) 타입 : HttpServerletRequest
	 *   		(2) 변수 : request
	 *   		(3) 사용자의 요청을 저장하는 변수이다.
	 *   			예) 사용자가 입력한 검색어, 아이디, 비밀번호 등이 저장된 곳이다.
	 *   	3) 매개변수-2
	 *   		(1) 타입 : HttpServerletRespond
	 *   		(2) 변수 : response;
	 *   		(3) 서버의 응답 정보를 저장하는 변수이다.
	 *   			예) 검색어의 결과, 로그인 성공 유무 등이 저장된 곳이다.
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 호출");
		if(request.getMethod().equalsIgnoreCase("GET")) {	// GET 방식의 요청이라고 한다면
			doGet(request, response); 	// doGet() 메소드 호출
		}else {
			doPost(request, response);
		}
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 4. doGet()
	 * 		1) GET 방식의 요청인 경우에 자동으로 호출되는 메소드이다. (service() 메소드가 없으면(service가 먼저 수행))
	 * 		2) GET 방식의 요청 방법
	 * 			(1) <form method="get">
	 * 			(2) $.ajax({type:'get', })
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 5. doPost()
	 * 		1) POST 방식의 요청인 경우에 자동으로 호출되는 메소드이다. (service() 메소드가 없으면(service가 먼저 수행))
	 * 		2) 요청(request)과 응답(request)을 모두 doGet() 메소드로 넘기고 자신은 아무 일도 하지 않는다. [같은 코드를 두번 사용방지, 할 일은 같음]
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		doGet(request, response);
	}

	/**
	 * @see Servlet#destroy()
	 * 6. destroy()
	 * 
	 * 	  웹 서버에서 프로젝트가 소멸되면 자동으로 호출된다.
	 */
	public void destroy() {
		System.out.println("destroy() 호출");
	}
	
	// domain/context path/servlst
}
