package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Gugudan {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// controller에서 인코딩해서 넘어온다.
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		StringBuffer sb = new StringBuffer();
		int startDan = Integer.parseInt(start);
		int endDan = Integer.parseInt(end);
		
		for(int dan = startDan; dan<=endDan; dan++) {
			for(int n = 1; n<10; n++) {
				// sb.append(dan).append("x").append(n).append("=").append(dan*n).append("<br/>");
				sb.append(dan + "x" + n + "= " + (dan*n)+"<br/>");
			}
			sb.append("<br>");
		}
		request.setAttribute("result", sb.toString());
		
		return "/view/gugudan.jsp";
	}
}
