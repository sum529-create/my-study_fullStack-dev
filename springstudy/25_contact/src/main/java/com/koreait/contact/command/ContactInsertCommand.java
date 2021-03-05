package com.koreait.contact.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.contact.dao.ContactDao;
import com.koreait.contact.dto.ContactDto;

public class ContactInsertCommand implements ContactCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ContactDto contactDto = new ContactDto();
		contactDto.setName(request.getParameter("name"));
		contactDto.setPhone(request.getParameter("phone"));
		contactDto.setAddress(request.getParameter("address"));
		contactDto.setEmail(request.getParameter("email"));
		contactDto.setNote(request.getParameter("note"));
		
		ContactDao contactDao = new ContactDao();
		
		contactDao.contactInsert(contactDto);

	}

}
