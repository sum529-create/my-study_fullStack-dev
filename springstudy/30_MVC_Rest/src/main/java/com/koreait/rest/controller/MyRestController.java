package com.koreait.rest.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping(value="getXMLList", produces="application/xml; charset=utf-8")
	public List<PersonDto> getXMLList(){
		List<PersonDto> list = new ArrayList<PersonDto>();
		for (int i = 0; i < 10; i++) {
			list.add(new PersonDto("사용자" + (i+1), 20 + i)); // 나이를 2n살씩 줌
		}
		return list;
	}
	@PostMapping(value="sendJSON",
			produces="application/json; charset=utf-8")
	public PersonDto sendJSON(@RequestBody PersonDto personDto){ // data 타입을 받아야한다.
		// @RequestBody
		// 전달 받은 데이터가 JSON/XML인 경우 이를 자동으로 Bean으로 변환한다.
		return personDto; // 주고받기 받아서 바로 보냄
	}
	
	// REST : URI + Method(GET, POST, PUT, DELETE)
	// 주소가 같은데 메소드에 따라 달라질 수 있다.
	// 요청 파라미터를 URI에 포함시킬 수 있습니다.
	
	// 기존 : simpleView?no=1
	// REST : simple/1
	
	// @PathVariable (경로변수) uri에 포함된 변수
	// 1. 주로 @RestController에서 사용됩니다.
	// 2. URI의 일부를 '{파라미터}'로 처리해서 변수에 저장할 수 있습니다.
	
	@GetMapping(value="name/{name}/age/{age}",	// URI에 {name}과 {age}는 요청 파라미터입니다. 
				produces="Application/json; charset=utf-8")
	public PersonDto sendPath(@PathVariable("name") String name, @PathVariable("age") int age) {// 파라미터 받는 것이 경로에 들어있음 
								// 파라미터가 URI에 포함된 경우 @PathVariable을 사용합니다.
		return new PersonDto(name, age);
	}
}
