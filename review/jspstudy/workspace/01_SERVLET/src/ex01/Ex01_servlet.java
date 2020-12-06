package ex01;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01_servlet")
public class Ex01_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex01_servlet() {
        System.out.println("생성자 호출");
    }

	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 호출");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 호출");
		if(request.getMethod().equalsIgnoreCase("GET")) {
			doGet(request, response);
		}else {
			doPost(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		doGet(request, response);
	}
	public void destroy() {
		System.out.println("destroy() 호출");
	}

}
