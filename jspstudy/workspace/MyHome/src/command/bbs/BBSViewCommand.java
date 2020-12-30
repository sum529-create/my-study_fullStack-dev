package command.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.BBSDao;
import dto.BBSDto;

public class BBSViewCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String str_bbs_no = request.getParameter("bbs_no");
		
		int bbs_no = 0;
		if(str_bbs_no != null && !str_bbs_no.isEmpty()) {
			bbs_no = Integer.parseInt(str_bbs_no);
		}
		BBSDto bbsDto = BBSDao.getInstance().bbsView(bbs_no);
		
		// 보고 있는 게시물인 bbsDto를 session에 올려 두면, 수정이나 삭제가 쉽다.
		HttpSession session = request.getSession();
		session.setAttribute("bbsDto", bbsDto);
		
		// 보고 있는 게시물에 달려있는 답변 목록을 가져오기
		
		// 조회수 증가하기
		BBSDao.getInstance().bbsUpdateHit(bbs_no); 
		// 굳이 잘 넘어갔는지 처리하지 않는다. 그래서 int result로 받아주지 않는다.
		
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("bbs/bbsViewPage.jsp");
		pathNRedirect.setRedirect(false);
		
		return pathNRedirect;
	}

}
