package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.GreenDto;

public class GreenDao {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	private static DataSource dataSource;
	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private GreenDao() {}
	
	private static GreenDao greenDao = new GreenDao();
	
	public static GreenDao getInstance() {
		return greenDao;
	}
	
	
	/****** 1. 접속 해제 ******/
	public void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(con != null) {
				con.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/****** 2. 전체 목록 가져오기 ******/
	public ArrayList<GreenDto> list(){
		ArrayList<GreenDto> list = new ArrayList<GreenDto>();
		
		try {
			con = dataSource.getConnection();
			sql = "SELECT * FROM GREEN ORDER BY HIT DESC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				GreenDto greenDto = new GreenDto();
				greenDto.setNo(rs.getInt("NO"));
				greenDto.setWriter(rs.getString("WRITER"));
				greenDto.setTitle(rs.getString("title"));
				greenDto.setContent(rs.getString("CONTENT"));
				greenDto.setHit(rs.getInt("HIT"));
				greenDto.setPostDate(rs.getDate("POSTDATE"));
				
				list.add(greenDto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		
		return list;
		
	}
	
	/****** 3. 삽입하기 ******/
	public int insert(GreenDto greenDto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "INSERT INTO GREEN VALUES(GREEN_SEQ.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, greenDto.getWriter());
			ps.setString(2, greenDto.getTitle());
			ps.setString(3, greenDto.getContent());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close(con, ps, null);
		}
		return result;
	}
	
	/****** 4. 게시글 가져오기 ******/
	public GreenDto view(int no) {
		GreenDto greenDto = null;
		
		try {
			con = dataSource.getConnection();
			sql = "SELECT * FROM GREEN WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				greenDto = new GreenDto();
				greenDto.setNo(rs.getInt(1));	// db순서대로 번호를 넣어서 사용가능함
				greenDto.setWriter(rs.getString(2));
				greenDto.setTitle(rs.getString(3));
				greenDto.setContent(rs.getString(4));
				greenDto.setHit(rs.getInt(5));
				greenDto.setPostDate(rs.getDate(6));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		
		return greenDto;
	}
	
	/****** 5. 조회수 증가하기 ******/
	
	public int updateHit(int no) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "UPDATE GREEN SET HIT = HIT+1 WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			result = ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
		
		return result;
	}
	
	/****** 6. 게시글 삭제하기 ******/
	public int delete(int no) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "DELETE FROM GREEN WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			result = ps.executeUpdate(); 
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
		return result;
	}
	
	
	/****** 7. 게시글 수정하기 ******/
	public int update(GreenDto greenDto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "UPDATE GREEN SET TITLE = ?, CONTENT = ? WHERE NO = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, greenDto.getTitle());
			ps.setString(2, greenDto.getContent());
			ps.setInt(3, greenDto.getNo());
			result = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, null);
		}
		return result;
	}
	
	
}
