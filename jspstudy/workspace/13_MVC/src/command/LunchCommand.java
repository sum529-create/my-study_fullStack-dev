package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LunchCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("when", "점심");
		request.setAttribute("what", "김치찌개");
		
		return "view/output.jsp";
	}

}
