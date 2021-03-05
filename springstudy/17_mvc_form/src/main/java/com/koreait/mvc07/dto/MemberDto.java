package com.koreait.mvc07.dto;

public class MemberDto {
	
	// field
	private String id;
	private String pw;
	
	// contructor
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	
	// method
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
	
	
}
