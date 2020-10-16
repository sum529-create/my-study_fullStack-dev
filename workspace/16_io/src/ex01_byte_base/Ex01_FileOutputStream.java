package ex01_byte_base;

import java.io.FileOutputStream;
import java.io.IOException;

/*
 * FileOutputStream 클래스
 * 1. 바이트 기반 파일 출력 스트림을 생성하는 클래스이다.
 *    1) 바이트 기반: 출력 단위가 바이트이다.
 *    2) 파일 출력 스트림: 파일을 생성할 수 있는 스트림(통로)
 * 2. 출력 메소드: write() 메소드
 * 3. 반드시 예외 처리(try-catch)가 필요하다.
 */

public class Ex01_FileOutputStream {

	public static void main(String[] args) {
		
		// FileOutputStream 객체 선언		
		FileOutputStream fos = null;
		
		// 객체 생성(new)은 try 내부에서 처리한다.
		
		try {
			
			// first.txt를 만들 수 있는 fos 객체
			fos = new FileOutputStream("first.txt");
			
			// first.txt파일에 보낼 데이터
			int ch1 = 'A';
			int ch2 = 'Z';
			String str1 = "Hello";
			String str2 = "Nice to meet you";
			
			// first.txt파일에 데이터 보내기(출력)
			
			// 1) write(int)
			fos.write(ch1);
			fos.write(ch2);
			fos.write('\n');  // 줄 바꿈
			
			// 2) write(byte[])
			// getBytes() 메소드: String타입 -> byte배열
			fos.write(str1.getBytes());
			fos.write('\n');
			fos.write(str2.getBytes());
			
			// 메시지
			System.out.println("first.txt파일이 생성되었습니다.");
			
		} catch (IOException e) {
			
			System.out.println("first.txt파일에 데이터가 기록되지 않았습니다.");
		
		} finally {
			
			// FileOutputStream 객체 fos는 반드시 close() 처리해야 한다.
			// close() 메소드를 호출하려면 별도의 예외 처리가 필요하다.
			
			try {
				if (fos != null) {
					fos.close();
				}
			} catch (Exception e) {
				
			}
			
		}
		
	}

}


