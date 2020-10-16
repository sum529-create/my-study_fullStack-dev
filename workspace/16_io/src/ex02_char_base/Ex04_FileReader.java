package ex02_char_base;

import java.io.FileReader;

public class Ex04_FileReader {

	public static void main(String[] args) {
				
		FileReader fr = null;
		
		try {
			
			fr = new FileReader("webpage.html");
			
			StringBuffer sb = new StringBuffer();
			
			// 여러 글자 읽기 (char[])
			while (true) {
				char[] cbuf = new char[2];
				int state = fr.read(cbuf);
				if (state == -1) {
					break;
				}
				sb.append(cbuf);
			}
			
			System.out.println(sb.toString());
			
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