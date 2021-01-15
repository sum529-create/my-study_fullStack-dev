package com.koreait.contact1.command;

import java.util.List;

import org.springframework.ui.Model;

import com.koreait.contact1.dao.ContactDao;
import com.koreait.contact1.dto.ContactDto;

public class ContactListCommand implements ContactCommand{
	
	@Override
	public void execute(Model model) {
		
		// ContactDao.java
		
		// 생성자를 호출하는 것은 template을 불러오는 것이다. 외부에서 사용가능
		ContactDao contactDao = new ContactDao();
		// Dao에서 1개를 생성하여 controller든 insert든 어디에서 new로 생성을 하여도 
		// 동일한 template을 하는 것이다.
		
		List<ContactDto> list = contactDao.contactList();
		model.addAttribute("list", list);
		
	}
}
