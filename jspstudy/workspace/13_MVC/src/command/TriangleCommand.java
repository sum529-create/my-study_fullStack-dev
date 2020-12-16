package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TriangleCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int width = Integer.parseInt(request.getParameter("width"));
		int height = Integer.parseInt(request.getParameter("height"));
		request.setAttribute("area", (width*height)/2.0);
		return "view/output.jsp";
	}

}
