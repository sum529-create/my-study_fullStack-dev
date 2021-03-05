package com.koreait.mvc02;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	/*
	 * @RequestMapping(value="URLMapping")
	 * 
	 * @RequestMapping(value = "/")	/는 컨텍스트패스를 의미합니다. (http://localhost/mvc02/)
	 * @RequestMapping("/")			value 속성만 존재하면 value=""를 생략할 수 있습니다.
	 * 
	 * @RequestMapping(method = RequestMethod.GET)	GET방식의 요청, 생략할 수 있습니다.
	 * @GetMapping()으로 요청할 수도 있습니다.
	 * 
	 * @RequestMapping(method = RequestMethod.POST) POST방식의 요청, 생략이 불가능합니다.
	 * POST방식은 @POSTMapping()으로 요청할 수도 있습니다.
	 */
	
	/*
	 * home 메소드
	 * 
	 * 1. 반환 타입: String, 뷰의 이름을 반환한다.
	 * 2. 메소드명: home, 아무 역할이 없습니다. 아무 일도 안 합니다.
	 * 3. 매개변수 : Model model, request를 이용하는 클래스가 Model입니다. 보안처리가 향상되어 있습니다.
	 * 4. 반환값 : return "index"
	 * 		뷰 리졸버(View Resolver)에 의해서(servlet-context.xml에 Bean으로 정의되어 있습니다.)
	 * 		return "/WEB-INF/views/index.jsp"; 와 같이 해석됩니다.
	 */
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		
		return "index";
	}
	
}
