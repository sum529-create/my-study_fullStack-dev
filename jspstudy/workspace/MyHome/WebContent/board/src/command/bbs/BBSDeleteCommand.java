package command.bbs;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.BBSDao;
import dao.ReplyDao;
import dto.BBSDto;

public class BBSDeleteCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String page = request.getParameter("page");
		
		// 댓글이 달려 있는지 확인한다.
		// session에 저장된 bbsDto에서 bbs_no를 꺼낸 뒤 댓글 개수를 확인한다.
			HttpSession session = request.getSession();
			BBSDto bbsDto = (BBSDto) session.getAttribute("bbsDto");
			int bbs_no = bbsDto.getBbs_no();
			
			int replyCount = ReplyDao.getInstance().replyCount(bbs_no);
			int result = 0;
			PathNRedirect pathNRedirect = new PathNRedirect();
			if (replyCount == 0) {  // 댓글이 없으면 삭제가 가능하다.
				result = BBSDao.getInstance().bbsDelete(bbs_no);
				if (result > 0) {
					pathNRedirect.setPath("/MyHome/bbsListPage.bbs?page=" + request.getParameter("page"));
					pathNRedirect.setRedirect(true);  // redirect
				}
			}
			
			PrintWriter out = null;
			if (result == 0) {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('게시물이 삭제되지 않았습니다.')");
				out.println("history.go(-2)");
				out.println("</script>");
				out.close();
			}
			if (replyCount != 0) {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('댓글이 달린 게시물은 삭제할 수 없습니다.')");
				out.println("history.go(-2)");
				out.println("</script>");
				out.close();
			}
			
			return pathNRedirect;
	}

}
