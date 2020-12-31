package command.bbs;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.BBSDao;
import dto.BBSDto;

public class BBSUpdateCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String bbs_title = request.getParameter("bbs_title");
		String bbs_content = request.getParameter("bbs_content");
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		String page = request.getParameter("page");
		
		// 위 값들을 모으기 위해서 두 방법을 사용할 수 있다.
		// 1) DTO		2) MAP
		
		BBSDto bbsDto = new BBSDto();
		bbsDto.setBbs_title(bbs_title);
		bbsDto.setBbs_content(bbs_content);
		bbsDto.setBbs_no(bbs_no);
		
		int result = BBSDao.getInstance().bbsUpdate(bbsDto);
		
		/* DB를 사용한 DAO 방법 */
		// BBSDto bbsDto2 = BBSDao.getInstance().bbsView(bbs_no);
		
		/* 위 줄과 같은 의미, 다른 방법 session */
		/* HttpSession session = null;
		 * HttpSession session = request.getSession();
		 * BBSDto bbsDto3 = (BBSDto)session.getAttribute("bbsDto");
		 * bbsDto3.setBbs_title(bbs_title); 
		 * bbsDto3.setBbs_content(bbs_content);
		 */
		
		PathNRedirect pathNRedirect = null;
		if (result > 0) {
			/*
			 * BBSDto bbsDto2 = BBSDao.getInstance().bbsView(bbs_no); 
			 * // 다시 업데이트된 viewPage보여주기 위해서 
			 * session = request.getSession();
			 * session.setAttribute("bbsDto", bbsDto2);
			 * - 이미 viewPage에서 올림
			 */
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("/MyHome/bbsViewPage.bbs?bbs_no=" + bbs_no + "&page=" + page);
			pathNRedirect.setRedirect(true);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시물을 수정할 수 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return pathNRedirect;
	}

}
