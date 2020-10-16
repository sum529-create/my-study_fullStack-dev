package ex01_byte_base;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/*
 * FileInputStream 클래스
 * 1. 바이트 기반 파일 입력 스트림을 생성하는 클래스이다.
 * 2. 파일을 읽어 들이는 스트림을 생성한다.
 * 3. 입력 메소드: read() 메소드
 */

public class Ex02_FileInputStream {

	public static void main(String[] args) {
		
		FileInputStream fis = null;
		
		try {
			
			fis = new FileInputStream("first.txt");
			
			StringBuffer sb = new StringBuffer();  // 읽어 들인 10 바이트를 차곡차곡 모을 장소
			
			// 10 바이트씩 여러 번 읽어 들이기 위하여 while문 사용
			while (true) {
				
				// 읽어 들일 단위 : 10 바이트
				byte[] bytes = new byte[10];
				
				// first.txt파일에서 10 바이트 읽어 bytes 배열에 저장
				// read() 메소드는 파일이 종료되면 -1을 반환한다.
				int state = fis.read(bytes);
							
				if (state == -1) {
					break;  // while (true) 종료
				}
				
				// sb에 bytes배열 추가해 두기
				// byte[]을 append() 메소드는 지원하지 않아서 다른 타입으로 변환 후 추가한다.
				// byte[] -> String
				sb.append(new String(bytes));
				
			}  // end while(true)
			
			System.out.println(sb.toString());
			
		} catch (FileNotFoundException e) {
			
			System.out.println("first.txt파일을 찾을 수 없습니다.");
			
		} catch (IOException e) {
			
			System.out.println("first.txt파일을 읽을 수 없습니다.");
			
		} finally {
			
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}

}