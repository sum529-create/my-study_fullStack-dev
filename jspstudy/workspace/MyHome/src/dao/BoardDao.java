package dao;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.DBService;

public class BoardDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private BoardDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BoardDao boardDao = new BoardDao();
	public static BoardDao getInstance() {
		return boardDao;
	}
	
	// 메소드
	
	
}