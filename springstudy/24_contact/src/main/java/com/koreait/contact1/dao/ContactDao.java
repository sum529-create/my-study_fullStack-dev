package com.koreait.contact1.dao;


import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.koreait.contact1.common.SpringJdbc;
import com.koreait.contact1.dto.ContactDto;

public class ContactDao {
	
	// DBCP를 직접 사용할 때는
	// 연결, PreparedStatement 생성, 실행, 반복, 연결 종료 등 모든 작업을
	// 반복적으로 개발자가 수행합니다.
	
	// 이 중 몇몇 작업(연결, PreparedStatement 생성 등)을 JdbcTemplate template이 처리합니다.
	
	// 톰캣의 context.xml을 사용하지 않기 때문에
	// context.looup("java:comp/env/jdbc/oralce")를 호출할 필요가 없습니다.
	
	// common 패키지의 SpringJdbc.template을 불러와서 사용하면 됩니다.
	
	// field
	private JdbcTemplate template;
	
	public ContactDao() {
		this.template = SpringJdbc.template;
	}
			
	// 공통 필드는 이제 String sql 뿐입니다.
	private String sql;
	
	/***** 1. list *****/
	public List<ContactDto> contactList(){
		sql = "SELECT * FROM CONTACT";	// BeanPropertyRowMapper : 이행에서 불러온 행들을 가져와서 어떤 클래스와 매핑을 할까 -> Dto
		List<ContactDto> list = template.query(sql, new BeanPropertyRowMapper<ContactDto>(ContactDto.class));	// type이 들어올때는 class를 붙여준다.
																			//<contact type>
		// * .query 매핑되는것 알아서 가지고 옴
		return list;
	}
}
