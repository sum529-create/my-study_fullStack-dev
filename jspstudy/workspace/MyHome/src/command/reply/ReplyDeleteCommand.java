package command.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.ReplyDao;

public class ReplyDeleteCommand implements ReplyCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String strrNo = request.getParameter("rNo");
		
		int rNo = 0;
		if(strrNo != null && !strrNo.isEmpty()) {
			rNo = Integer.parseInt(strrNo);
		}
		String bbs_no = request.getParameter("bbs_no");
		String page = request.getParameter("page");
		int result = ReplyDao.getInstance().replyDelete(rNo);
		
		
		PathNRedirect pathNRedirect = null;
		if(result > 0) {
			// * 만약 .jsp를 사용하게 된다면? => 값이 넘어가지 않게 된다. 그래서
			// 1. 그 동안 했던 방식 (패턴을 지키는 방식) => bbs/bbsViewResultPage.bbs
			// Result에서 다시 jsp에서 controller로 갔던 방식으로 사용했으나.
			
			// 지금은 jsp로 넘기는 방식을 사용해 본다.
			// 	pathNRedirect.setPath("bbs/bbsViewPage.jsp");
			// 2. 곧바로 DB를 거치도록 이동 (/bbsViewPage.bbs)
			
			pathNRedirect = new PathNRedirect();	// java에서는 el사용 불가
			pathNRedirect.setPath("/MyHome/bbsViewPage.bbs?bbs_no="+bbs_no + "&page=" + page);
			pathNRedirect.setRedirect(true);	// redirect
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글을 삭제할 수 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return pathNRedirect;
	}

}
