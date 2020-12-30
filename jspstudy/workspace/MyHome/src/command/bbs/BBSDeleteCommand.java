package command.bbs;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.ReplyDao;
import dto.BBSDto;

public class BBSDeleteCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 댓글이 달려 있는지 확인한다.
		// session에 저장된 bbsDto에서 bbs_no를 꺼낸 뒤 댓글 개수를 확인한다.
		HttpSession session = request.getSession();
		BBSDto bbsDto = (BBSDto)session.getAttribute("bbs_no");
		int bbs_no = bbsDto.getBbs_no();
		int replyCount = ReplyDao.getInstance().replyCount(bbs_no);
		
		PathNRedirect pathNRedirect = null;
		if(replyCount == 0) {	// 댓글이 없으면 삭제가 가능하다.
			
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글이 달린 게시물은 삭제할 수 없습니다.')");
			out.println("history.go(-2)");
			out.println("</script>");
			out.close();
		}
		
		
		return null;
	}

}
