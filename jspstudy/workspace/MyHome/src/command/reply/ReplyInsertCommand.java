package command.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.ReplyDao;
import dto.ReplyDto;

public class ReplyInsertCommand implements ReplyCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String rWriter = request.getParameter("rWriter");
		String rPw = request.getParameter("rPw");
		String rContent = request.getParameter("rContent");
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		ReplyDto replyDto = new ReplyDto();
		replyDto.setrWriter(rWriter);
		replyDto.setrPw(rPw);
		replyDto.setrContent(rContent);
		replyDto.setBbs_no(bbs_no);
		replyDto.setrIp(request.getRemoteAddr());
		
		int result = ReplyDao.getInstance().replyInsert(replyDto);
		
		PathNRedirect pathNRedirect = null; 
		if(result > 0) {
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("/MyHome/bbsViewPage.bbs");
			// bbsViewPage에 댓글창이 있음
			pathNRedirect.setRedirect(true);	// redirect
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글이 작성되지 않았습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return pathNRedirect;
	}

}
