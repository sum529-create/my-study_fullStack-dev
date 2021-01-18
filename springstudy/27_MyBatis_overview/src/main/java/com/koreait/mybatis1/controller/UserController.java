package com.koreait.mybatis1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.mybatis1.dao.UsersDao;

@Controller
public class UserController {
	
	// Mybatis를 사용하는 경우에는
	// SqlSession 클래스를 사용합니다.
	
	// field
	@Autowired
	private SqlSession sqlSession;
	
	// method
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="usersInsertPage.do", method=RequestMethod.GET)
	public String usersInsertPage(Model model) {
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class); 
		
		return "users/usersInsertPage";
	}
	
	/*
	 * UsersDao와 users.xml이 연결되어 있습니다.
	 * UsersDao의 특정 메소드를 호출하면 연결된 users.xml의 쿼리가 실행됩니다.
	*/
	
	@RequestMapping(value="userListPage.do", method=RequestMethod.GET)
	public String usersListPage(Model model) {
		// mapper처럼 사용할 것.
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class); 
		model.addAllAttributes(usersDao.usersList());
		return "users/usersListPage";
	}
	
}
