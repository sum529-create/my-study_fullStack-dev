package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.GuestDto;
import mybatis.config.DBService;

public class GuestDao {
	private SqlSessionFactory factory;
	
	private GuestDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static GuestDao guestDao = new GuestDao();
	public static GuestDao getInstance() {
		return guestDao;
	}
	
	// 메소드
	public List<GuestDto> selectGuestList(){
		SqlSession ss = factory.openSession();
		List<GuestDto> list = ss.selectList("mybatis.mapper.guest.selectGuestList");
		ss.close();
		return list;
	}
	
	public int insert(GuestDto guestDto) {
		SqlSession ss = factory.openSession(false);	// commit이 가능하게 하기 위해서 false처리
		int result = ss.insert("mybatis.mapper.guest.guestInsert", guestDto);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public GuestDto selectBygNo(int gNo) {
		SqlSession ss = factory.openSession();
		GuestDto guestDto = ss.selectOne("mybatis.mapper.guest.selectBygNo", gNo);
		ss.close();
		return guestDto;
	}
	
	public int guestDeleteFile(int gNo) {
		SqlSession ss = factory.openSession();
		int result = ss.update("mybatis.mapper.guest.guestDeleteFile", gNo);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int guestDelete(int gNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete("mybatis.mapper.guest.guestDelete", gNo);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public int guestUpdate(GuestDto guestDto) {
		SqlSession ss = factory.openSession(false);	// update commit을 위한 false
		int result = ss.update("mybatis.mapper.guest.guestUpdate", guestDto);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public List<GuestDto> queryList(String query){
		SqlSession ss = factory.openSession();
		List<GuestDto> list = ss.selectList("mybatis.mapper.guest.queryList", query);
		ss.close();
		return list;
	}
}
