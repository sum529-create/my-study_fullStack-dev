package dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.EmpDto;
import dto.WhiteDto;
import mybatis.config.DBService;

public class EmpDao {
	private SqlSessionFactory factory;
	
	private EmpDao() {
		factory = DBService.getInstance().getFactory();
	}
	private static EmpDao empDao = new EmpDao();
	public static EmpDao getInstance() {
		return empDao;
	}
	
	// 메소드
	public List<EmpDto> allList(){
		SqlSession ss = factory.openSession();
		List<EmpDto> list = ss.selectList("mybatis.mapper.emp.allList");	// id 별도 부여
		ss.close();
		return list;
	}
	
	public List<EmpDto> deptList(Map<String, String[]> map){
		SqlSession ss = factory.openSession();
		List<EmpDto> list = ss.selectList("mybatis.mapper.emp.deptList", map); // 함수이름과 맞출필요없다. deptList
		ss.close();
		return list;
	}
	public List<EmpDto> dynamicList(Map<String, String> map){
		SqlSession ss = factory.openSession();
		List<EmpDto> list = ss.selectList("mybatis.mapper.emp.dynamicList", map); // 함수이름과 맞출필요없다. deptList
		ss.close();
		return list;
	}
}
