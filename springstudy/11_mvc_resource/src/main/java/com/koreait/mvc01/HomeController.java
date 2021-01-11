package com.koreait.mvc01;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 * @Controller
 :안녕. 난 Controller야. 일반 Java Class로 만들면 돼
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// 자바를 위해서 로그를 찍어주는 문구
	/*
	 * @RequestMapping 
	 * :안녕, 난 URLMapping값을 처리하는 메소드야.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );	/* 뷰(JSP)에 전달하는 값 */
		
		return "home";	/* 뷰(JSP)의 이름 */
		
		// return "home";
		// WEB-INF/views/home.jsp 를 의미한다.
		
		// home이라는 메소드가 home.jsp로 'serverTime'의 값을 보냈다.
		// resource 파일은 assets과 같은 역할을 하는 폴더
		
		// servlet-context.xml에 정의되어 있는 뷰 리졸버가 return "home";을 처리한다.
		// 1. 앞에 /WEB-INF/view를 추가한다.
		// 2. 뒤에 .jsp를 추가한다.
		
		// return "home"은
		// return "/WEB-INF/views/home.jsp"를 의미한다.
		
		// jsp를 사용하지 않아도 된다. servlet-context.xml에서 커스터마이징을 했음.
		// <beans:property name="suffix" value=".jsp" />
		
	}
	
}
