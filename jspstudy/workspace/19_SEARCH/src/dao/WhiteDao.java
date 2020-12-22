package dao;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.DBService;

public class WhiteDao {
	private SqlSessionFactory factory;
	
	private WhiteDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static WhiteDao whiteDao = new WhiteDao();
	public static WhiteDao getInstance() {
		return whiteDao;
	}
}
