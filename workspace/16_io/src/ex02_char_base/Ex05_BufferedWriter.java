package ex02_char_base;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class Ex05_BufferedWriter {

	public static void main(String[] args) {
		
		BufferedWriter bw = null;
		
		try {
			bw = new BufferedWriter(new FileWriter("text2.txt"));
			bw.write("안녕하세요\n");
			bw.write("반갑습니다\n");
			System.out.println("text2.txt파일이 생성되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (bw != null) { bw.close(); }
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

}