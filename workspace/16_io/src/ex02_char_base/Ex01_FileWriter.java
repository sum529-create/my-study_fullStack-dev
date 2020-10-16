package ex02_char_base;

import java.io.FileWriter;

/*
 * FileWriter 클래스
 * 1. 문자 기반의 파일 출력 스트림을 생성하는 클래스이다.
 * 2. byte[] 대신 char[], String 을 사용한다.
 * 3. 출력 메소드: write() 메소드
 * 4. 나머지 특성은 FileOutputStream 클래스와 동일하다.
 */

public class Ex01_FileWriter {

	public static void main(String[] args) {
		
		FileWriter fw = null;
		
		try {
			
			fw = new FileWriter("text1.txt");
			
			fw.write("안녕하세요");
			fw.write('\n');
			fw.write("반갑습니다");
			
			System.out.println("text1.txt파일을 생성했습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fw != null) { fw.close(); }
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}
