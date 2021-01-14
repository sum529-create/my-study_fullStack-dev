package com.koreait.simple2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/*
 * 이번 SimpleDao는 singleton으로 만들지 않습니다.
 * 	* singleton (인스턴스가 오직 1개만 생성 되야 하는 경우에 사용되는 패턴)
 * 대신 SimpleDao의 생성을 Spring에게 맡기는 DI방식을 사용하겠습니다.
 */

public class SimpleDao {
	private DataSource dataSource;
	public SimpleDao() {
		try {
			Context context = new InitialContext();
			// context로 dataSource를 얻어온다.
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	
}
