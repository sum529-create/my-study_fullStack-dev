package command.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Paging;
import common.PathNRedirect;
import dao.AdminDao;
import dto.MemberDto;

public class AdminMemberListCommand implements AdminCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 전체 member의 갯수를 구한다.
		int totalMemberCount = AdminDao.getInstance().getTotalMemberCount();
		
		// page가 전달되지 않으면 page = 1이다.
		String strPage = request.getParameter("page");
		if(strPage == null || strPage.isEmpty()) {
			strPage = "1";
		}
		int page = Integer.parseInt(strPage);
		
		// recordPerPage를 정한다.
		int recordPerPage = 20;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage -1;
		endRecord = (endRecord > totalMemberCount) ? endRecord : totalMemberCount;
		
		// beginRecord + endRecord를 DB로 보내야 하는데 가장 손 쉬운 방법중 하나가
		// -> Map 이다
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRecord", beginRecord); 
		map.put("endRecord",endRecord);
		
		// DB에서 명단 가져오기
		List<MemberDto> list = AdminDao.getInstance().adminMemberList(map);
		
		// paging
		String paging = Paging.getPaging("/MyHome/adminMemberListPage.admin", totalMemberCount, recordPerPage, recordPerPage);
		
		// request에 저장할 데이터
		// admin/adminMemberList.page 으로 forward
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("totalMemberCount", totalMemberCount);
		request.setAttribute("recordPerPage", recordPerPage);
		request.setAttribute("paging", paging);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("admin/adminMemberListPage.jsp");
		pathNRedirect.setRedirect(false);
		
		return pathNRedirect;
	}

}
