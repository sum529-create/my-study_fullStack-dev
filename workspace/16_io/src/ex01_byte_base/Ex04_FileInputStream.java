package ex01_byte_base;


import java.io.FileInputStream;

public class Ex04_FileInputStream {

	public static void main(String[] args) {
		
		// read() 메소드로 first.txt 파일 읽기
		
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream("first.txt");
			// read() 메소드는 int(4바이트) 만큼 읽어 들인다.
			// 파일이 종료되면 -1을 반환한다.
			StringBuffer sb = new StringBuffer();
			while (true) {
				int data = fis.read();
				if (data == -1) {
					break;
				}
				sb.append((char)data);
			}
			System.out.println(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

	}

}




