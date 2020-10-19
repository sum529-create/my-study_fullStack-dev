package ex01_network;

import java.io.*;
import java.net.URL;

public class Ex05_openStream {

	public static void main(String[] args) {
		
		String host = "http://www.naver.com";
		
		URL url = null;
		BufferedInputStream bis = null;		// 서버파일을 읽는 스트림
		BufferedOutputStream bos = null;	// 로컬PC에 파일을 생성하는 스트림
		
		int data = 0;	// 읽어서 옮기는 단위
		
		try {
			url = new URL(host);
			bis = new BufferedInputStream(url.openStream()); // 서버의 파일을 읽는 bis
			// String fileName = url.gerFile();
			// bos = new BufferedOutputStream(new FileOutputStream(fileName));
			bos = new BufferedOutputStream(new FileOutputStream("다운받은파일.txt"));	// 로컬pc에 파일을 생성하는 bos
			while((data=bis.read())!= -1) {		// bis가 종료되지 않았다면
				bos.write(data); 	// 서버에서 읽은 data를 로컬PC '다운받은파일.txt'로 보낸다.
			}
			System.out.println("다운로드가 완료되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				// 닫을때는 생성된 순서 반대로 닫는다.
				if(bos != null) {
					bos.close();
				}
				if(bis != null) {
					bis.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
	}

}
