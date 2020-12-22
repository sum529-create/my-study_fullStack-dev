package command.emp;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import common.PathNRedirect;
import dao.EmpDao;

public class SearchDeptCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		/* 파라미터가 1개: String */
		/*
		String department_id = request.getParameter("department_id");
		if (department_id == null || department_id.isEmpty()) {
			department_id = "10";
		}
		*/
		
		/* 파라미터가 2개 이상: String[] */
		String[] department_id = request.getParameterValues("department_id");
		if (department_id == null || department_id.length == 0) {
			department_id = new String[1];
			department_id[0] = "10";
		}
		
		/*
		List<String> department_list = new ArrayList<String>();
		for (int i = 0; i < department_id.length; i++) {
			department_list.add(department_id[i]);
		}
		*/
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("department_list", department_id);
		request.setAttribute("list", EmpDao.getInstance().deptList(map));
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("emp/listPage.jsp");
		pathNRedirect.setRedirect(false);
		return pathNRedirect;
	}

}
