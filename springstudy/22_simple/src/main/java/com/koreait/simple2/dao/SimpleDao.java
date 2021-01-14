package com.koreait.simple2.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.koreait.simple2.dto.SimpleDto;

/*
 * 이번 SimpleDao는 singleton으로 만들지 않습니다.
 * 	* singleton (인스턴스가 오직 1개만 생성 되야 하는 경우에 사용되는 패턴)
 * 대신 SimpleDao의 생성을 Spring에게 맡기는 DI방식을 사용하겠습니다.
 */

public class SimpleDao {
	private DataSource dataSource;
	public SimpleDao() {
		try {
			Context context = new InitialContext();
			// context로 dataSource를 얻어온다.
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	private void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) { rs.close(); }
			if (ps != null) { ps.close(); }
			if (con != null) { con.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/***** 1. list *****/
	public List<SimpleDto> simpleList() {
		
		List<SimpleDto> list = new ArrayList<SimpleDto>();
		
		try {
			con = dataSource.getConnection();
			sql = "SELECT NO, WRITER, TITLE, CONTENT, REGDATE FROM SIMPLE2";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();  // select문 실행 메소드
			while (rs.next()) {
				int no = rs.getInt("NO");
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				Date regDate = rs.getDate("REGDATE");
				SimpleDto simpleDto = new SimpleDto(no, writer, title, content, regDate);
				list.add(simpleDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		
		return list;
		
	}
	
	/****** 2. insert ******/
	public void simpleInsert(SimpleDto simpleDto) {
		try {
			con = dataSource.getConnection();
			sql = "INSERT INTO SIMPLE2 VALUES(SIMPLE_SEQ2, ?, ?, ?, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, simpleDto.getTitle());
			ps.setString(2, simpleDto.getTitle());
			ps.setString(3, simpleDto.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con,ps,null);
		}
	}
	
	/****** 3. view ******/
	
	
	/****** 4. delete ******/
	public void simpleDelete(int no) {
		SimpleDto simpeDto = null;
		try {
			con = dataSource.getConnection();
			sql = "DELETE FROM SIMPLE2 WHERE NO=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
	}
}
