package ex03;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.DBConnect;
import vo.jobVO;

public class Ex01_updateTest {

	public static void main(String[] args) {
		
		// JOB_ID 가 DR인 데이터의 MIN_SALARY를 4000으로 수정하고,
		// MAX_SALARY를 5500으로 수정하시오.
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		// jobVO객체 생성
		// UPDATE문의 실행에 필요한 정보만 담는다.
		// 디폴트 타입으로 생성해서 필요한 정보만 setter로 저장한다.
		jobVO jobVO = new jobVO();
		jobVO.setJob_id("DR");
		jobVO.setMin_salary(4000);
		jobVO.setMax_salary(5500);
		
		try {
			conn = DBConnect.getConnection();
			sql = "UPDATE JOB SET MIN_SALARY = ?, MAX_SALARY = ? WHERE JOB_ID = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, jobVO.getMin_salary());
			ps.setInt(2, jobVO.getMax_salary());
			ps.setString(3,jobVO.getJob_id());
			result = ps.executeUpdate();
			if (result > 0) {
				System.out.println(jobVO.getJob_id() + "이(가) 수정되었습니다.");
			}else {
				System.out.println(jobVO.getJob_id() + "이(가) 수정되지 않았습니다.");
			}
			// result (수정된 데이터의 개수가 반환된다.)
			// 1) 0 : 수정된 ROW가 0개 이다.
			// 2) 1 : 수정된 ROW가 1개이다.
			
		} catch (Exception e) {		// ClassNotFoundException, SQLException 모두 처리
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		
	}

}
