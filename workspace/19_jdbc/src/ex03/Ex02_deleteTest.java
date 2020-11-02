package ex03;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.DBConnect;
import vo.jobVO;

public class Ex02_deleteTest {

	public static void main(String[] args) {
		
		// 차장을 삭제하시오.
		
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		jobVO jobVO = new jobVO();
		jobVO.setJob_id("CJ");
		
		try {
			conn = DBConnect.getConnection();
			sql = "DELETE FROM JOB WHERE JOB_ID = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, jobVO.getJob_id());
			result = ps.executeUpdate();
			if (result > 0) {
				System.out.println(jobVO.getJob_id() + "이(가) 수정되었습니다.");
			}else {
				System.out.println(jobVO.getJob_id() + "이(가) 수정되지 않았습니다.");
			}
			// result (수정된 데이터의 개수가 반환된다.)
			// 1) 0 : 수정된 ROW가 0개 이다.
			// 2) 1 : 수정된 ROW가 1개이다.
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) { ps.close(); }
				if(conn != null) { conn.close();}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
