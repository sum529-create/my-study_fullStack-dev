package ex01_network;

import java.net.URL;
import java.net.URLConnection;

public class Ex03_URLConnection {
	
	public static void main(String[] args) {
		
		String host = "http://springlec.cafe24.com/lecture/notice.txt";
		URL url = null;
		URLConnection conn = null;
		
		try {
			url = new URL(host);
			conn = url.openConnection();
			System.out.println(conn.getContentType()); 	// 컨텐트타입 
			System.out.println(conn.getLastModified()); // 최종수정
			System.out.println(conn.getURL()); 			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
