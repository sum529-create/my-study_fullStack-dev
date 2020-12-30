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
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public BBSDto bbsView(int bbs_no) {
		SqlSession ss = factory.openSession();
		BBSDto bbsDto = ss.selectOne("mybatis.mapper.bbs.bbsView", bbs_no);
		ss.close();
		return bbsDto;
	}
	
	public int bbsUpdateHit(int bbs_no) {
		SqlSession ss = factory.openSession(false);	// false) insert, update, delete들의 commit을 직접 처리하겠다.
		int result = ss.update("mybatis.mapper.bbs.bbsUpdateHit", bbs_no);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int bbsDelete(int bbs_no) {
		SqlSession ss = factory.openSession(false);	// false) insert, update, delete들의 commit을 직접 처리하겠다.
		int result = ss.delete("mybatis.mapper.bbs.bbsDelete", bbs_no);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	
	
}