package ex02_char_base;

import java.io.FileReader;

/*
 * FileReader 클래스
 * 1. 문자 기반의 파일 입력 스트림을 생성하는 클래스이다.
 * 2. 입력 메소드: read() 메소드
 */

public class Ex03_FileReader {

	public static void main(String[] args) {
		
		FileReader fr = null;
		
		try {
			
			fr = new FileReader("text1.txt");
			
			// 한 글자씩 읽기 (int)
			int ch = 0;
			while ( (ch = fr.read()) != -1 ) {
				System.out.print((char)ch);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fr != null) { fr.close(); }
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}
