package command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDto;

public class BoardCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String[] titles = request.getParameterValues("titles");
		String[] writers = request.getParameterValues("writers");
		String[] contents = request.getParameterValues("contents");
		
		// Dao에 저장되면 올린다. -> db
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		for(int i = 0; i<titles.length; i++) {
			BoardDto bDto = new BoardDto();
			bDto.setTitle(titles[i]);
			bDto.setWriter(writers[i]);
			bDto.setContent(contents[i]);
			boardList.add(bDto);
		}
		request.setAttribute("boardList", boardList);
		return "view/resultPage.jsp";
	}

}
