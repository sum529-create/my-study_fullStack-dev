package ex04;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnect;
import vo.jobVO;

// int result (x), ResultSet rs (o) 수가 아닌 데이터 출력
// arrayList사용하여 출력
// oracle은 데이터를 ResultSet에 저장하지만, 
// java는 ResultSet을 지원하지 않아 jobVO에 담아서 사용한다. 
// oracle에서 자바로 resultSet으로 전송한다


public class Ex01_selectListTest {

	public static void main(String[] args) {
		// Oracle DB는 결과를 ResultSet에 담아서 Java에게 준다.
		// Java는 받은 결과를 VO(DTO)에 담는다.
		// 받은 결과가 2개 이상이면 VO(or DTO)를 저장할 List를 준비해서 저장한다.
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		String sql = null;
		
		List<jobVO> jobs = new ArrayList<jobVO>();
		
		try {
			con = DBConnect.getConnection();
			sql = "SELECT * FROM JOB";	// select가 무조건 적인 rs는 아니다. -> count(*)
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				// rs -> JobVO
				/*
				 * rs의 상태
				 * job_id + job_title + min_salary + max_salary
				 * job_id + job_title + min_salary + max_salary
				 * ...
				 * rs.next() 한 번 호출마다 한 row -> jobVO 객체 -> ArrayList에 add 
				 */
				
				jobVO vo = new jobVO();
				vo.setJob_id(rs.getString(1));
				vo.setJob_title(rs.getString(2));
				vo.setMin_salary(rs.getInt(3));
				vo.setMax_salary(rs.getInt(4));
				jobs.add(vo);	// jobVO -> ArrayList에 add
			}
			System.out.println(jobs.size());
//			for(jobVO vo : jobs) {
//				
//				System.out.println(vo);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!= null) {
					rs.close();
				}
				if(ps!= null) {
					ps.close();
				}
				if(con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
