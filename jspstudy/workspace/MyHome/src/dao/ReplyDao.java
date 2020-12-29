package dao;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.DBService;

public class ReplyDao {
	private SqlSessionFactory factory;
	
	private ReplyDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static ReplyDao replyDao = new ReplyDao();
	public static ReplyDao getInstance() {
		return replyDao;
	}
	
	// 메소드

}
