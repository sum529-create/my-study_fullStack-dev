package command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.MemberDto;


@WebServlet("/MemberFindPw")
public class MemberFindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberFindPw() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String mEmail = request.getParameter("mEmail");
		
		MemberDto memberDto = MemberDao.getInstance().selectBymEmail(mEmail);
		
		String responseText = null;
		if (memberDto == null) {
			responseText = "no";
		} else {
			responseText = memberDto.getmNo() + "";
		}
		
		response.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(responseText);
		out.close();
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}