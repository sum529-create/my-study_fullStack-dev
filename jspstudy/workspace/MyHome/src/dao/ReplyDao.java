package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.ReplyDto;
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
	public int replyInsert(ReplyDto replyDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.reply.replyInsert", replyDto);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
}
