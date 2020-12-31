package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardDto;
import mybatis.config.DBService;

public class BoardDao {

	// 필드
	private SqlSessionFactory factory;
	
	// 생성자(Singleton)
	private BoardDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static BoardDao boardDao = new BoardDao();
	public static BoardDao getInstance() {
		return boardDao;
	}
	
	// 메소드
	public int getTotalRecord() {
		SqlSession ss = factory.openSession();
		int totalRecord = ss.selectOne("mybatis.mapper.board.getTotalRecord");
		ss.close();
		return totalRecord;
	}
	public List<BoardDto> boardList(Map<String, Integer> map) {
		SqlSession ss = factory.openSession();
		List<BoardDto> list = ss.selectList("mybatis.mapper.board.boardList", map);
		ss.close();
		return list;
	}
	
	public int boardInsert(BoardDto boardDto) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert("mybatis.mapper.board.boardInsert", boardDto);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	public BoardDto boardView(int bNo) {
		SqlSession ss = factory.openSession();
		BoardDto boardDto = ss.selectOne("mybatis.mapper.board.boardView", bNo);
		ss.close();
		return boardDto;
	}
	public int boardUpdateHit(int bNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update("mybatis.mapper.board.boardUpdateHit", bNo);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
}