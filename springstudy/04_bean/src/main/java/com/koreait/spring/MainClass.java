package com.koreait.spring;

public class MainClass {

	public static void main(String[] args) {
		Song song = new Song();
		song.setTitle("Dynamite");
		song.setGenre("댄스");
		
		Singer singer = new Singer();
		singer.setName("BTS");
		singer.setSong(song);
		
		singer.singerInfo();

	}

}
