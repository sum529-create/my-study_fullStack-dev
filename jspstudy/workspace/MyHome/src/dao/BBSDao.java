package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.PageVo;
import dto.BBSDto;
import mybatis.config.DBService;

public class BBSDao {
	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private BBSDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BBSDao bbsDao = new BBSDao();
	public static BBSDao getInstance() {
		return bbsDao;
	}
	
	// 메소드
	public int getTotalRecord() {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.bbs.getTotalRecord");
		ss.close();
		return totalRecord;
	}
	public List<BBSDto> bbsList(PageVo pageVo) {
		SqlSession ss = factory.openSession();
		List<BBSDto> list = ss.selectList("mybatis.mapper.bbs.bbsList", pageVo);
		ss.close();
		return list;
	}
	public int bbsInsert(BBSDto bbsDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.bbs.bbsInsert", bbsDto);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
}
