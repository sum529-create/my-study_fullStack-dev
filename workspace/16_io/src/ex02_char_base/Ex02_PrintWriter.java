package ex02_char_base;

import java.io.PrintWriter;

/*
 * PrintWriter 클래스
 * 1. 문자 기반의 파일 출력 스트림을 생성하는 클래스이다.
 * 2. 출력 메소드
 *    1) write()
 *    2) print()
 *    3) println()
 */

public class Ex02_PrintWriter {

	public static void main(String[] args) {
	
		PrintWriter out = null;
		
		try {
			
			out = new PrintWriter("webpage.html");
			
			// write()도 되고,
			out.write("<html>");
			out.write("\n");
			
			// print()도 되고,
			out.print("안녕");
			out.print('\n');
			
			// println()도 된다.
			out.println("</html>");  // 출력 후 자동으로 줄 바꿈도 삽입해 준다.
			
			System.out.println("webpage.html파일이 생성되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) { out.close(); }
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}
