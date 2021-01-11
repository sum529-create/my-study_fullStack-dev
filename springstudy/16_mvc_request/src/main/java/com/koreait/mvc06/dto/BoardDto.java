package com.koreait.mvc06.dto;

import java.sql.Date;

public class BoardDto {
	// field
	private String title;
	private String content;
	private int hit;
	private Date date;
	
	// constructor
	public BoardDto() {
		
	}

	public BoardDto(String title, String content, int hit, Date date) {
		super();
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.date = date;
	}

	// method
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
