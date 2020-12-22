package dao;


import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.DBService;

public class EmpDao {
	private SqlSessionFactory factory;
	
	private EmpDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static EmpDao empDao = new EmpDao();
	public static EmpDao getInstance() {
		return empDao;
	}
	
	// 메소드

}
