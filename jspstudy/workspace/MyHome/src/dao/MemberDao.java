package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDto;
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
	
	// 메소드
	public MemberDto selectByIdPw(MemberDto memberDto) {
		SqlSession ss = factory.openSession();
		
		MemberDto dto = ss.selectOne("mybatis.mapper.member.selectBymIdmPw", memberDto);
		ss.close();
		
		return dto;
	}
}
