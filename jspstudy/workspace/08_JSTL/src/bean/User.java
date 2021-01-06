package bean;

import java.sql.Date;

public class User {
	private String id;
	private String pw;
	private Date regDate;
	
	public User() {}
	
	
	

	public User(String id, String pw, Date regDate) {
		super();
		this.id = id;
		this.pw = pw;
		this.regDate = regDate;
	}




	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
