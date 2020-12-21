package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BlackStringCommand implements BlackCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "<tr><td colspan=\"5\">AJAX통신결과</td></tr>";
	}

}
