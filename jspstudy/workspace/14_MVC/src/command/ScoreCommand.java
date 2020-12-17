package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScoreCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 실행 결과는 request에 저장
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		
		double average = (kor+eng+mat)/3.0;
		
		// 평균
		request.setAttribute("average", average);
		
		// 합격 유무(80이상 합격)
		request.setAttribute("pass", average >= 80? "합격" : "불합격");
		
		// 응답할 view를 결과로 반환
		return "view/scoreOutput.jsp";	
		// forward가 있어 contextPath를 명시하면 안된다. /14_MVC/~ 는 못붙인다.
		// forward는 같은 서버내부에서 실행이 된다. /14_MVC/~ 이 경로가 폴더인줄 알기때문에
		// forward는 URL을 통해서 이동된 경로를 확인할 수 없다.
	}

}
