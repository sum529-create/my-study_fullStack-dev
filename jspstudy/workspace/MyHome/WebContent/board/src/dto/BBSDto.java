package dto;

import java.sql.Date;

public class BBSDto {
	private int bbs_no;
	private String bbs_writer;
	private String bbs_title;
	private String bbs_content;
	private String bbs_pw;
	private int bbs_hit;
	private String bbs_ip;
	private Date bbs_date;
	
	public int getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getBbs_writer() {
		return bbs_writer;
	}
	public void setBbs_writer(String bbs_writer) {
		this.bbs_writer = bbs_writer;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_pw() {
		return bbs_pw;
	}
	public void setBbs_pw(String bbs_pw) {
		this.bbs_pw = bbs_pw;
	}
	public int getBbs_hit() {
		return bbs_hit;
	}
	public void setBbs_hit(int bbs_hit) {
		this.bbs_hit = bbs_hit;
	}
	public String getBbs_ip() {
		return bbs_ip;
	}
	public void setBbs_ip(String bbs_ip) {
		this.bbs_ip = bbs_ip;
	}
	public Date getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(Date bbs_date) {
		this.bbs_date = bbs_date;
	}
	
}
