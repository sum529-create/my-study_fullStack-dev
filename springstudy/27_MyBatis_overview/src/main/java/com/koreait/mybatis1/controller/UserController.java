package com.koreait.mybatis1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.mybatis1.dao.UsersDao;
import com.koreait.mybatis1.dto.UsersDto;

@Controller
public class UserController {

	// Mybatis를 사용하는 경우에는
	// SqlSession 클래스를 사용합니다.
	
	// field
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// method
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="usersInsertPage.do", method=RequestMethod.GET)
	public String usersInsertPage() {
		return "users/usersInsertPage";
	}
	
	
	/*
		UsersDao와 users.xml이 연결되어 있습니다.
		UsersDao의 특정 메소드를 호출하면 연결된 users.xml의 쿼리가 실행됩니다.
	*/
	@RequestMapping(value="usersListPage.do", method=RequestMethod.GET)
	public String usersListPage(Model model) {
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		model.addAttribute("list", usersDao.usersList());
		return "users/usersListPage";
	}
	
	/*
	@RequestMapping(value="usersInsert.do", method=RequestMethod.POST)
	public String usersInsert1(@RequestParam("name") String name,
			                 @RequestParam("phone") String phone) {
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		usersDao.usersInsert1(name, phone);
		return "redirect:usersListPage.do";
	}
	*/
	@RequestMapping(value="usersInsert.do", method=RequestMethod.POST)
	public String usersInsert2(UsersDto usersDto) {
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		usersDao.usersInsert2(usersDto);
		return "redirect:usersListPage.do";
	}
	
	@RequestMapping(value="usersViewPage.do", method=RequestMethod.GET)
	public String usersView(@RequestParam("no") int no, Model model) {
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		model.addAttribute("usersDto", usersDao.usersView(no));
		return "users/usersViewPage";
	}
	
	@RequestMapping(value="usersUpdate.do", method=RequestMethod.POST)
	public String usersUpdate(UsersDto usersDto) {
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		usersDao.usersUpdate(usersDto);
		return "redirect:usersViewPage.do?no=" + usersDto.getNo();
	}
	
	@RequestMapping(value="usersDelete.do", method=RequestMethod.POST)
	public String usersDelete(@RequestParam("no") int no) {
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		usersDao.usersDelete(no);
		return "redirect:usersListPage.do";
	}
	
}