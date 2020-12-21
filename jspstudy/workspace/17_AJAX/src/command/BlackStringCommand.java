package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BlackDao;
import dto.BlackDto;

public class BlackStringCommand implements BlackCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// return "<tr><td colspan=\"5\">AJAX통신결과</td></tr>";
		List<BlackDto> list = BlackDao.getInstance().list();
		String result = "";
		for(BlackDto blackDto : list) {
			result += "<tr>";
			result += "<td>" + blackDto.getName() + "</td>";
			result += "<td>" + blackDto.getAge() + "</td>";
			result += "<td>" + blackDto.getGender() + "</td>";
			result += "<td>" + blackDto.getPhone() + "</td>";
			result += "<td>" + blackDto.getAddress() + "</td>";
			result += "<tr>";
		}
		
		return result;
	}

}
