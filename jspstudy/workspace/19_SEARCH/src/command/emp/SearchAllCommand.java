package command.emp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import common.PathNRedirect;
import dao.EmpDao;
import dto.EmpDto;

public class SearchAllCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		List<EmpDto> list = EmpDao.getInstance().allList();
		request.setAttribute("list", list);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("emp/listPage.jsp");
		pathNRedirect.setRedirect(false);
		
		return pathNRedirect;
	}

}
