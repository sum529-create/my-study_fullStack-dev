package com.koreait.contact.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreatorFactory;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.koreait.contact.common.SpringJdbc;
import com.koreait.contact.dto.ContactDto;

public class ContactDao {
	private JdbcTemplate template;
	
	public ContactDao() {
		this.template = SpringJdbc.template;
	}
	
	private String sql;
	
	/***** 1. list *****/
	public List<ContactDto> contactList(){
		sql = "SELECT * FROM CONTACT";
		List<ContactDto> list = template.query(sql, new BeanPropertyRowMapper<ContactDto>(ContactDto.class));
		return list;
	}
	
	/***** 2. insert *****/
	public void contactInsert(ContactDto contactDto) {
		sql = "INSERT INTO CONTACT VALUES(CONTACT2_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, contactDto.getName());
				ps.setString(2, contactDto.getPhone());
				ps.setString(3, contactDto.getAddress());
				ps.setString(4, contactDto.getEmail());
				ps.setString(5, contactDto.getNote());
			}
		});
		
	}
	
	/***** 3. view *****/
	public ContactDto contactView(int no) {
		sql = "SELECT * FROM CONTACT WHERE NO = ?";
		ContactDto contactDto = template.queryForObject(sql, new BeanPropertyRowMapper<ContactDto>(ContactDto.class));
		return contactDto;
	}
	
}
