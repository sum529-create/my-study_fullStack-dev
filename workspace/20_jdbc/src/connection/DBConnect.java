package connection;

import java.sql.*;

public class DBConnect {
	
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String user = "HR";
	private static String password = "1111";
	private static String jdbcdriver = "oracle.jdbc.driver.OracleDriver";
	
	public static Connection getConnection() throws Exception{
		Class.forName(jdbcdriver);
		return DriverManager.getConnection(url, user, password);
	}
}
