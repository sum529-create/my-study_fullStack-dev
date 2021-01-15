package com.koreait.contact1.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.contact1.dao.ContactDao;
import com.koreait.contact1.dto.ContactDto;

public class ContactInsertCommand implements ContactCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String name = request.getParameter("name");
		String phone  = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String note = request.getParameter("note");
		
		ContactDto contactDto = new ContactDto();
		contactDto.setName(name);
		contactDto.setPhone(phone);
		contactDto.setAddress(address);
		contactDto.setEmail(email);
		contactDto.setNote(note);
		
		ContactDao contactDao = new ContactDao();	
		// new로 만들어도 만들어진 ContactDao의 template은 하나이기에 어디서든 new를 사용해도 같은 dao이다
		
		// contactDao.contactInsert1(contactDto);
		
		// 모아서 전달할 수 있다
		// contactDao.contactInsert2(name, phone, address, email, note);
		
		contactDao.contactInsert3(contactDto);	
		
	}

}
