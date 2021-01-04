package command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDao;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IdCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTf-8");
		String mId = request.getParameter("mId");
		response.setContentType("application/json; charset=UTF-8");
		
		JSONObject responseObj = new JSONObject();
		
		if(MemberDao.getInstance().selectBymId(mId) == null) {
			responseObj.put("result", true);
		}else {
			responseObj.put("result", false);
		}
		
		PrintWriter out = response.getWriter();
		out.println(responseObj);
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
