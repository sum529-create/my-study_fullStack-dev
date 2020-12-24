package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/JSONHandler")
public class JSONHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JSONHandler() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		JSONObject obj = new JSONObject();
		String name = request.getParameter("name");
		String sage = request.getParameter("age"); 
		int age = Integer.parseInt(sage);

		boolean isMarried = Boolean.parseBoolean(request.getParameter("isMarried"));
		obj.put("name", name.charAt(0));
		obj.put("age", age);
		obj.put("isMarried", isMarried ? "기혼" : "미혼");
		request.setAttribute("result", obj);
		request.getRequestDispatcher("output.jsp").forward(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
