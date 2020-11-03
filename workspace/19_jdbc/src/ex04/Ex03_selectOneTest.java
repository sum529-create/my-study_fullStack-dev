package ex04;

import java.sql.*;

import connection.DBConnect;

public class Ex03_selectOneTest {

	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int count = 0;
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			sql = "SELECT COUNT(*) AS ROW_COUNT FROM JOB";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt("ROW_COUNT");
			// 	SELECT의 결과가 ResultSet이 아니기 때문에 executeQuery() 메소드가 아니다.
			System.out.println("전체 ROW: " + count);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
