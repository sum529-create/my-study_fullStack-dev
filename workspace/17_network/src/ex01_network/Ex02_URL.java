package ex01_network;

import java.net.URL;

public class Ex02_URL {

	public static void main(String[] args) {
		
		String host = "http://www.naver.com/abc.txt";
		
		URL url = null;
		
		try {
			url = new URL(host);
			System.out.println(url.getDefaultPort());
			System.out.println(url.getPath());
			System.out.println(url.getFile());
			System.out.println(url.getProtocol());
			System.out.println(url.getHost());
		}catch (Exception e) {
			e.printStackTrace();
		}

	}

}
