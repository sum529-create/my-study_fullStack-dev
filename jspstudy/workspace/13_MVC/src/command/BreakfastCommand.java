package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BreakfastCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("when", "아침");
		request.setAttribute("what", "콘푸로스트");
		
		return "view/output.jsp";
	}

}
