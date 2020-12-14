package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	
}
