package command.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.MemberDto;

@WebServlet("/MemberFindId")
public class MemberFindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberFindId() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mEmail = request.getParameter("mEmail");
		
		MemberDto memberDto = MemberDao.getInstance().selectBymEmail(mEmail);
		if(memberDto == null) {
			request.setAttribute("foundId", "no");
		}else {
			request.setAttribute("foundId", memberDto.getmId());
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
