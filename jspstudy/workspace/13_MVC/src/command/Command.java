package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// super클래스로 KoreanCommand와 EnglishCommand로 상속을 받는다.
	
	public String execute(HttpServletRequest request, HttpServletResponse response);
	// 이렇게 생긴 메소드를 만들어라.
	// class에서 interface - add 클릭 command 찾기 - 확인 
	
	
	
}
