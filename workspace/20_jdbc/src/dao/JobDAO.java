package dao;

import java.sql.*;

import connection.DBConnect;
import dto.JobDTO;

// DAO : Database Access Object
// DB에 접근하는 객체
// CRUD를 처리하는 객체
// CREATE : INSERT
// READ   : SELECT
// UPDATE : UPDATE
// DELETE : DELETE

public class JobDAO {
	
	// FIELD
	private Connection con;	// 자동으로 null
	private PreparedStatement ps;
	private String sql;
	private int result;
	
	// select 용 
	
	// CONSTRUCTOR
	public JobDAO() {
		try {
			// 접속만 해 두자.
			con = DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
	
	// METHOD
	/***** 1. 삽입 메소드 *****/
	public int insert(JobDTO dto) {
		try {
			sql = "INSERT INTO JOB VALUES(?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getJob_id());
			ps.setString(2, dto.getJob_title());
			ps.setInt(3, dto.getMin_salary());
			ps.setInt(4, dto.getMax_salary());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
