package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.BlueDto;

public class BlueDao {

	// 필드
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	
	// 그 동안 사용하던 DriverManager 클래스를 사용하지 않기 때문에 
	// getConnection() 메소드를 만들어서 사용하지 않는다.
	// DBCP 방식은 Connection을 DataSource 클래스가 관리한다.
	// 앞으로는 DataSource 객체가 제공하는 getConnection() 메소드를 사용한다.
	
	// DataSource 객체 만들기 (새로운 작업)
	private static DataSource dataSource;
	// static{} // static 블록에서 static필드의 초기화를 할 수 있다.
	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			// Tomcat의 경우 java:comp/env/ 를 prefix로 사용한다.
			// context.xml의 <Resource>태그의 name속성이 jdbc/oracle이다.
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	// Singleton pattern
	private BlueDao() {	}
	
	private static BlueDao blueDao = new BlueDao();
	public static BlueDao getInstance() {
		return blueDao;
	}
	
	// 메소드
	/******  1. 접속 종료 ******/
	public void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(con != null) {
				con.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/****** 2. 접속 테스트 ******/
	public void test() {
		try {
			con = dataSource.getConnection();
			System.out.println("접속 성공");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, null, null);
		}
	}

	/****** 3. 목록 가져오기 ******/
	public ArrayList<BlueDto> list() {
		ArrayList<BlueDto> list = new ArrayList<BlueDto>();
		try {
			con = dataSource.getConnection();
			sql = "SELECT * FROM BLUE";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {	// 결과가 없을 때까지
				BlueDto blueDto = new BlueDto();
				blueDto.setNo(rs.getInt("NO"));	// rs.getInt(1)
				blueDto.setWriter(rs.getString("WRITER"));
				blueDto.setTitle(rs.getString("TITLE"));
				blueDto.setContent(rs.getString("CONTENT"));
				blueDto.setPostDate(rs.getDate("POSTDATE"));
				list.add(blueDto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return list;
	}
	

	/****** 4. 게시글 삽입하기 ******/
	public int insert(BlueDto blueDto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "INSERT INTO BLUE VALUES(BLUE_SEQ.NEXETVAL, ?, ? , ?, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, blueDto.getWriter());
			ps.setString(2, blueDto.getTitle());
			ps.setString(3, blueDto.getContent());
			result = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
		
		return result;
	}
}