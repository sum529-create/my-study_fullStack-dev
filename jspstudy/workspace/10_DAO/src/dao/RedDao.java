package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.RedDto;

// DAO : Database Access Object
// 데이터베이스 처리를 담당하는 클래스

public class RedDao {

	// 필드
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	// 생성자 (Singleton Pattern)
	// 1. RedDao 클래스 내부에서만 new RedDao()를 허용해서 외부에서는 RedDao를 생성할 수 없다.
	// 2. RedDao 클래스 내부에서 1개의 인스턴스를 생성한다.
	// 3. 생성된 인스턴스를 가져다 사용할 수 있는 메소드(getInstance)를 생성한다.
	
	
	private RedDao() {}
	private static RedDao redDao = new RedDao();
	public static RedDao getInstance() {	// new RedDao() 없이(객체, 인스턴스 없이)
									//  호출할 수 있도록 클래스 메소드로 만든다.
									// (static())
		return redDao;	// 클래스메소드는 static만 포함할 수 있다. (시점의 문제)
						// 따라서 redDao 역시 static 처리한다.
	}
	
	
	// 메소드 (CRUD) [create, read, use, delete]
	
	/***** 1. 접속 *****/
	
	public Connection getConnection() {
		try {
			// 접속 정보 준비
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "spring";
			String password = "1111";
			
			// jdbc(OracleDriver)준비
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 접속
			con = DriverManager.getConnection(url, user, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
	
	/***** 2. 접속해제 *****/
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
	
	/***** 접속(Connection)은 무조건 메소드마다 열고 닫는다. *****/
	
	
	/***** 3. 삽입하기 *****/
	public int insert(RedDto redDto) {
		int result = 0;
		try {
			// 접속
			con = getConnection();
			// ** 수동 커밋 처리 방법(한번만 해봅시다.)
			con.setAutoCommit(false);
			
			// 미리 sql 준비 <- ps를 사용하기 때문
			sql = "INSERT INTO RED VALUES(RED_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";	// ? -> 변수
			// ps: SQL 전달 및 실행
			// ps에게 SQL 전달
			ps = con.prepareStatement(sql) ;
			// 변수(?) 채우기
			ps.setString(1, redDto.getId()); 	// 첫번째 ?에 아이디 채우기
			ps.setString(2, redDto.getPw());
			ps.setString(3, redDto.getName());
			ps.setInt(4, redDto.getAge());
			ps.setString(5, redDto.getEmail());
			// SQL 실행
			result = ps.executeUpdate();	// insert, update, delete 모두 사용
			
			// ** 커밋은 성공했을 때 실시
			if(result == 1) {
				con.commit(); 	// 수동으로 직접 커밋
			}
		}catch(Exception e) {
			// ** catch 블록은 실패하면 도착
			if (con != null) {
				try {
					con.rollback();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
		}finally {
			// 접속해제
			// ResultSet이 없는 경우는 insert, update, delete문 처리할 때
			close(con, ps, null);		
		}
		return result;
	}
	
	/***** 4. 전체 목록 *****/
	public ArrayList<RedDto> list(){
		ArrayList<RedDto> list = new ArrayList<RedDto>();
		try {
			con = getConnection();
			sql = "SELECT * FROM  RED";
			ps = con.prepareStatement(sql);
			// SQL 실행: select문은 executeQuery(), 반환타입은 ResultSet
			rs = ps.executeQuery();
			// ResultSet은 그냥 사용할 수 없다.
			// ResultSet -> ArrayList<RedDto>
			// rs.next()는 ResultSet에 저장된 데이터 한 개
			// rs.next()는 RedDto 한 개를 의미함
			while(rs.next()) {
				RedDto redDto = new RedDto();
				// rs -> RedDto 로 변환
				redDto.setNo(rs.getInt("NO"));
				redDto.setId(rs.getString("ID"));
				redDto.setPw(rs.getString("PW"));
				redDto.setName(rs.getString("NAME"));
				redDto.setAge(rs.getInt("age"));
				redDto.setEmail(rs.getString("EMAIL"));
				redDto.setRegDate(rs.getDate("REGDATE"));
				// redDto -> ArrayList에 추가
				list.add(redDto);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return list;
	}
	
	
}












