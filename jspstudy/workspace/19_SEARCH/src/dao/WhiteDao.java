package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.WhiteDto;
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
	
	// 메소드
	public List<WhiteDto> list(){
		SqlSession ss = factory.openSession();
		List<WhiteDto> list = ss.selectList("mybatis.mapper.white.getList");	// id 별도 부여
		ss.close();
		return list;
	}
	public List<WhiteDto> titleList(String query) {
		SqlSession ss = factory.openSession();
		List<WhiteDto> list = ss.selectList("mybatis.mapper.white.getTitleList", query);
		ss.close();
		return list;
	}
	
	public List<WhiteDto> contentList(String query) {
		SqlSession ss = factory.openSession();
		List<WhiteDto> list = ss.selectList("mybatis.mapper.white.getContentList", query);
		ss.close();
		return list;
	}
	
	public List<WhiteDto> bothList(String query) {
		SqlSession ss = factory.openSession();
		List<WhiteDto> list = ss.selectList("mybatis.mapper.white.getBothList", query);
		ss.close();
		return list;
	}
}
