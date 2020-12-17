package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GreenCommand {
	
	public String execute(HttpServletRequest request, HttpServletResponse response);
	
}
