package mybatis.config;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {

	// DBService: SqlSessionFactory 만들어서 반환하는 클래스
	
	// 필드
	private SqlSessionFactory factory;
	
	// 생성자: Singleton
	private DBService() {
		try {
			String resource = "mybatis/config/sqlmap-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private static DBService service = new DBService();
	public static DBService getInstance() {
		return service;
	}
	
	// 메소드
	public SqlSessionFactory getFactory() {
		return factory;
	}
	
}