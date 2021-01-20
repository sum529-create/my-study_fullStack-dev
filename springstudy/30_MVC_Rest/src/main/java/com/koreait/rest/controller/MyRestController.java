package com.koreait.rest.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.rest.dto.PersonDto;

/*
	@RestController
	1. Rest방식의 controller이다.
	2. 모든 메소드에는 자동으로 @ResponseBody가 붙는 것으로 처리합니다.
		: 모든 메소드의 반환값은 jsp가 아니라. 데이터 자체입니다.
		
	데이터 형식만을 반환한다. -> 글자만
*/


@RestController
public class MyRestController {
	@RequestMapping(value="getText",
					method=RequestMethod.GET,
					produces="text/plain; charset=utf-8")
	// 같은 의미
	/*@GetMapping(value="getText",
				method = RequestMethod.GET,
				produces="text/plain; charset=utf=8")*/
	// @ResponseBody 생략하는 이유는 @RestController이기 때문이다.
	public String getText() {
		return "안녕하세요";
		// 데이터 자체를 의미 파일이름이 아님
	}
	
	/*
	public String getJSON() {
		// 1) 우리가 연습한 json-simple
		JSONObject obj = new JSONObject();
		obj.put("name", "제임스");
		obj.put("age", 20);
		return obj.toJSONString(); -> jackson
		
		// 2) open api
		// String responseBody = "{\"name\":\"제임스\", \"age\":20}";
		// return responseBody;
	}
	*/
	@GetMapping(value="getJSON",
			produces="application/json; charset=utf-8")
	public PersonDto getJSON() {
		return new PersonDto("제임스", 20);
		// jackson 라이브러리는 
		// Bean을 자동으로 JSON으로 바꿔줍니다.
	}
	
	@GetMapping(value="getXML",
				produces="application/xml; charset=utf-8")
	public PersonDto getXML() {
		return new PersonDto("앨리스", 30);
		// jackson 라이브러리가 Bean을 XML로 자동으로 변환합니다.
		/*
		 * <name>앨리스</name>
		 * <age>30</age>
		 */
	}
	// mediatype은 spring 타입임	// "application/xml; charset=utf-8" 아래 같은 의미
	@GetMapping(value="getJSONList",
				produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<PersonDto> getJSONList(){
		List<PersonDto> list = new ArrayList<PersonDto>();
		for (int i = 0; i < 10; i++) {
			list.add(new PersonDto("사용자" + (i+1), 20 + i)); // 나이를 2n살씩 줌
		}
		return list;
	}
}
