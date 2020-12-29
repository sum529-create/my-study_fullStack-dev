package command.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.BBSDao;
import dto.BBSDto;

public class BBSInsertCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String bbs_title = request.getParameter("bbs_title");
		String bbs_writer = request.getParameter("bbs_writer");
		String bbs_pw = request.getParameter("bbs_pw");
		String bbs_content = request.getParameter("bbs_content");
		
		BBSDto bbsDto = new BBSDto();
		bbsDto.setBbs_title(bbs_title);
		bbsDto.setBbs_writer(bbs_writer);
		bbsDto.setBbs_pw(bbs_pw);
		bbsDto.setBbs_content(bbs_content);
		bbsDto.setBbs_ip(request.getRemoteAddr());
		
		int result = BBSDao.getInstance().bbsInsert(bbsDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("bbs/bbsInsertResult.jsp?result="+result);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
	}

}
