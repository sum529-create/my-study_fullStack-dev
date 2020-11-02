package ex01;

import java.sql.Connection;
import java.sql.SQLException;

import connection.DBConnect;

public class ConnectionTest {

	public static void main(String[] args){
		
		// DBConnect 클래스의 getConnection() 메소드는
		// 예외를 던지는 메소드이다.
		// 예외 처리를 위해서 try-catch 블록을 추가한다.
		
		Connection conn = null;
		
		
		try {
			conn = DBConnect.getConnection();
			System.out.println("DB 접속 성공");
		} catch (ClassNotFoundException e) {
			// classNotFoundException 오류 -> jdbcDriver 로드 오류, 빌드패스(경로) 잘못 잡음
			System.out.println("jdbcDriver를 확인하거나, Build Path를 확인하세요.");
		} catch (SQLException e) {
			System.out.println("url, user, password 정보를 확인하세요.");
		} catch(Exception e) {
			e.printStackTrace();
		} finally { // 접속에 성공하든 실패하든 처리하는 finally 블록
			try {
				if(conn != null) {	// 접속 성공시에만 닫아라. 
				//위에 null로 지정했기때문에 실패시에도 null로 지정되어 nullpointException 오류가 나올 수 있음
					conn.close();	// 빨간줄. Connection 객체 conn을 사용하려면 예외처리(try-catch 블록)가 필요하다
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
	}

}
