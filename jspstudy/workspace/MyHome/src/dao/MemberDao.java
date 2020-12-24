package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDto;
import mybatis.config.DBService;

public class MemberDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private MemberDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static MemberDao memberDao = new MemberDao();
	public static MemberDao getInstance() {
		return memberDao;
	}
	
	// 메소드
	public MemberDto selectBymIdmPw(MemberDto memberDto) {
		SqlSession ss = factory.openSession();
		MemberDto dto = ss.selectOne("mybatis.mapper.member.selectBymIdmPw", memberDto);
		ss.close();
		return dto;
	}
	public MemberDto selectBymEmail(String mEmail) {
		SqlSession ss = factory.openSession();
		MemberDto dto = ss.selectOne("mybatis.mapper.member.selectBymEmail", mEmail);
		ss.close();
		return dto;
	}
	public int updatemPw(MemberDto memberDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.member.updatemPw", memberDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	public int update(MemberDto memberDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.member.update", memberDto);
		if (result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	
	
	
	
}