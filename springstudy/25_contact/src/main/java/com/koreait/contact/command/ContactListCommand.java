package com.koreait.contact.command;

import java.util.List;

import org.springframework.ui.Model;

import com.koreait.contact.dao.ContactDao;
import com.koreait.contact.dto.ContactDto;

public class ContactListCommand implements ContactCommand {

	@Override
	public void execute(Model model) {
		ContactDao contactDao = new ContactDao();
		List<ContactDto> list = contactDao.contactList();
		model.addAttribute("list", list);
	}

}
