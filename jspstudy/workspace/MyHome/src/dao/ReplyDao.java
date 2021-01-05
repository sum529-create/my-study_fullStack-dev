package dao;

import java.util.List;

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
	
	public List<ReplyDto> replyList(int bbs_no){
		SqlSession ss = factory.openSession();
		List<ReplyDto> replyList = ss.selectList("mybatis.mapper.reply.replyList", bbs_no);
		ss.close();
		return replyList;
	}
	
	public int replyDelete(int rNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete("mybatis.mapper.reply.replyDelete", rNo);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public int replyCount(int bbs_no){
		SqlSession ss = factory.openSession();
		int replyCount = ss.selectOne("mybatis.mapper.reply.replyCount", bbs_no);
		ss.close();
		return replyCount;
	}
	
	
	
}
