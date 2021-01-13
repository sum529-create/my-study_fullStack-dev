package com.koreait.mvc10.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.mvc10.dto.Calculator;

@Controller
public class MyController {

	@RequestMapping(value={"/", "index"}, method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="calc", method=RequestMethod.GET)
	public String calc(Calculator calculator, Model model) {
		// 뷰(JSP)로 전달될 데이터를 model에 저장합니다.
		// 저장할 때 속성(Attribute)으로 저장합니다. (파라미터가 아닙니다.)
		model.addAttribute("calculator", calculator);
		
		calculator.setResult();  // 연산이 수행됩니다.
		if (calculator.getViewName().equals("result")) {
			return calculator.getViewName();  // forward 합니다. (result.jsp가 뷰인 경우입니다.)
		} else {
			return "redirect:" + calculator.getViewName();  // index.jsp로 이동하는 매핑값(index)을 이용합니다.
			// == return "redirect:/";  // index.jsp로 이동하는 매핑값(/)을 이용합니다.
		}
		
	}
	
}