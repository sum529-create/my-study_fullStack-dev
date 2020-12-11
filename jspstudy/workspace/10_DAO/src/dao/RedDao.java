package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	
}
