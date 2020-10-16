package ex02_char_base;

import java.io.BufferedReader;
import java.io.FileReader;

public class Ex06_BufferedReader {

	public static void main(String[] args) {
		
		BufferedReader br = null;
		
		try {
			
			br = new BufferedReader(new FileReader("text2.txt"));
			
			StringBuffer sb = new StringBuffer();
			while (true) {
				char[] cbuf = new char[5];
				int state = br.read(cbuf);
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
				if (br != null) {
					br.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}