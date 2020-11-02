package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	// field (접속 정보)
	private static String user = "HR";
	private static String password = "1111";
	private static String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static String jdbcDriver = "oracle.jdbc.driver.OracleDriver";	
	// -> 어떤 클래스를 사용할 것인가? 접속을 담당하는 Oracle 클래스
	
	
	// method (Connection 객체 생성 및 반환)
	// public static 결과타입 메소드명() { }
	public static Connection getConnection() throws Exception {
		
		// 1. jdbcDriver를 사용할 수 있도록 메모리에 로드한다.
		Class.forName(jdbcDriver);
		
		
		// 2. DriverMagager클래스가 접속 정보를 이용해서 접속(Connection)을 생성한다.
		Connection conn = DriverManager.getConnection(url, user, password);
		
		
		// 3. 접속 객체 conn을 반환한다.
		return conn;	// return conn = DriverManager.getConnection(url, user, password);
		
		
		// 안될 수 있는 경우를 생각하여 오류 처리 try catch를 사용한다.
		// Class, DriverManager 클래스는 예외처리를 필수로 해야 한다.
		// getConnection() 메소드에서 처리하지 말고, 
		// getConnection() 메소드룰 호출하는 영역으로 예외를 던지겠다.
		
		// 메소드가 예외를 던지는 방법
		// public  결과타입 메소드명() throws Exception { }
	}
}
