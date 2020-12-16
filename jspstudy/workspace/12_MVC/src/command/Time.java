package command;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Time {

	public String currentTime(HttpServletRequest request, HttpServletResponse response) {
		
		Date time = new Date(System.currentTimeMillis());
		SimpleDateFormat sf = new SimpleDateFormat("a hh:mm:ss");
		String cTime = sf.format(time);  
		request.setAttribute("cTime", cTime);
		
		return "view/time.jsp";
	}
	
}
