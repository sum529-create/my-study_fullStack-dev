package dao;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.DBService;

public class MemberDao {
	
	private SqlSessionFactory factory;
	
	private MemberDao() {
		factory = DBService.getInstance().getFactory();
		
	}
	private static MemberDao memberDao = new MemberDao();
	public static MemberDao getInstance() {
		return memberDao;
	}
	
	
}
