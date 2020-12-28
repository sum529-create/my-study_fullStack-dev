package dto;

import java.sql.Date;

public class GuestDto {
	
	private int gNo;
	private String gWriter;
	private String gTitle;
	private String gContent;
	private String gPw;
	private String gFilename;
	private Date gPostDate;
	
	
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public String getgWriter() {
		return gWriter;
	}
	public void setgWriter(String gWriter) {
		this.gWriter = gWriter;
	}
	public String getgTitle() {
		return gTitle;
	}
	public void setgTitle(String gTitle) {
		this.gTitle = gTitle;
	}
	public String getgContent() {
		return gContent;
	}
	public void setgContent(String gContent) {
		this.gContent = gContent;
	}
	public String getgPw() {
		return gPw;
	}
	public void setgPw(String gPw) {
		this.gPw = gPw;
	}
	public String getgFilename() {
		return gFilename;
	}
	public void setgFilename(String gFilename) {
		this.gFilename = gFilename;
	}
	public Date getgPostDate() {
		return gPostDate;
	}
	public void setgPostDate(Date gPostDate) {
		this.gPostDate = gPostDate;
	}
	
}
