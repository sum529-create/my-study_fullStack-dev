package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDto;
import mybatis.config.DBService;

public class AdminDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private AdminDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static AdminDao adminDao = new AdminDao();
	public static AdminDao getInstance() {
		return adminDao;
	}
	
	// 메소드
	public int getTotalMemberCount() {
		SqlSession ss = factory.openSession();
		int totalMemberCount = ss.selectOne("mybatis.mapper.admin.getTotalMemberCount");
		ss.close();
		return totalMemberCount;
	}
	
	public List<MemberDto> adminMemberList(Map<String, Integer> map){
		SqlSession ss = factory.openSession();
		List<MemberDto> list = ss.selectList("mybatis.mapper.admin.adminMemberList", map);
		ss.close();
		return list; 
	}
}