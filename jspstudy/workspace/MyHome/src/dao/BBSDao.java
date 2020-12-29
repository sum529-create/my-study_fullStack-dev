package dao;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.DBService;

public class BBSDao {
	private SqlSessionFactory factory;
	
	private BBSDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BBSDao bbsDao = new BBSDao();
	public static BBSDao getInstance() {
		return bbsDao;
	}
	
	// 메소드

}
