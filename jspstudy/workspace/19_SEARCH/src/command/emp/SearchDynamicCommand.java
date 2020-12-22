package command.emp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import common.PathNRedirect;
import dao.EmpDao;

public class SearchDynamicCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		
		// column + query : Map
		Map<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("query", query);
		
		request.setAttribute("list", EmpDao.getInstance().dynamicList(map));
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("emp/listPage.jsp");
		pathNRedirect.setRedirect(false);
		return pathNRedirect;
	}

}
