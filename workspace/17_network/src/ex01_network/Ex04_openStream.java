package ex01_network;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class Ex04_openStream {

	public static void main(String[] args) {
		// String host = "http://springlec.cafe24.com/lecture/notice.txt";
		String host = "http://www.naver.com";
		URL url = null;
		BufferedReader br = null;
		String line = "";
		StringBuffer sb = new StringBuffer();	// line 누적할 버퍼
		
		try {
			url = new URL(host);
			br =  new BufferedReader(new InputStreamReader(url.openStream()));
			while(true) {
				line = br.readLine();	// readLine() 한줄 읽어오기, 연결된 파일에서 라인1개씩 가져와서 line에 저장한다.
				if(line == null) {		// 읽어들인 라인이 없으면 
					break;
				}
				sb.append(line);
				
			}
			System.out.println(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}

}
