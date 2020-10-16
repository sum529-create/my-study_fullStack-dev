package ex01_byte_base;

import java.io.DataOutputStream;
import java.io.FileOutputStream;

/*
 * DataOutputStream 클래스
 * 1. 데이터 자체를 그대로 파일에 출력하는 클래스이다.
 * 2. 데이터에 따라 사용하는 메소드가 다르다.
 *    writeByte(), writeInt(), writeLong(), writeDouble() 등
 */

public class Ex07_DataOutputStream {

	public static void main(String[] args) {
		
		int[] score = {50, 60, 70, 80, 90};
		DataOutputStream dos = null;
		
		try {
			
			dos = new DataOutputStream(new FileOutputStream("score.bin"));
			
			for (int i = 0; i < score.length; i++) {
				dos.writeInt(score[i]);
			}
			
			System.out.println("score.bin파일이 생성되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (dos != null) {
					dos.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
