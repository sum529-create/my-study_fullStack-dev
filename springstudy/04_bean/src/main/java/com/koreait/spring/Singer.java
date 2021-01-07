package com.koreait.spring;

public class Singer {

	// field
	private String name;
	private Song song;
	
	// constructor
	public Singer() {
	
	}
	public Singer(String name, Song song) {
		super();
		this.name = name;
		this.song = song;
	}

	// method
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Song getSong() {
		return song;
	}
	public void setSong(Song song) {
		this.song = song;
	}
	public void singerInfo() {
		System.out.println("이름: " + name);
		song.songInfo();
	}
}
