package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DinnerCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("when", "저녁");
		request.setAttribute("what", "치킨");
		
		return "view/output.jsp";
	}

}
