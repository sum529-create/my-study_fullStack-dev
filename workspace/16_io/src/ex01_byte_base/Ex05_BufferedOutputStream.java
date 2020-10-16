package ex01_byte_base;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

/*
 * BufferedOutputStream 클래스
 * 1. FileOutputStream 클래스에 부착하는 보조스트림이다.
 * 2. Buffer(버퍼, 기억장소)를 사용하므로 속도가 빠르다.
 * 3. BufferedOutputStream 객체만 close() 처리하면 된다.
 */

public class Ex05_BufferedOutputStream {

	public static void main(String[] args) {
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		try {
			// 1. 메인스트림 fos 생성
			fos = new FileOutputStream("second.txt");
			
			// 2. 보조스트림 bos 생성 (fos에 부착)
			bos = new BufferedOutputStream(fos);
			
			// 1. + 2. 합쳐서 생성 
			// bos = new BufferedOutputStream(new FileOutputStream("second.txt"));
			
			// second.txt파일로 보낼 데이터
			int ch1 = '한';
			int ch2 = '글';
			String str1 = "안녕하세요.";
			String str2 = "반갑습니다.";
			
			// second.txt파일로 데이터 보내기
			// bos 객체 사용
			bos.write(ch1);
			bos.write(ch2);
			bos.write('\n');
			bos.write(str1.getBytes());
			bos.write('\n');
			bos.write(str2.getBytes());
			
			System.out.println("second.txt파일이 생성되었습니다.");			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// fos는 close() 하지 않는다.
				if (bos != null) {
					bos.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}