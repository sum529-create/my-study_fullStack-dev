package ex04_quiz;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

// 문제. 파일복사
// Coffee.mp4파일을 Coffee2.mp4로 복사하시오.
// 1. Coffee.mp4파일에서 적당히 데이터를 읽는다.
// 2. 읽어둔 데이터를 Coffee2.mp4파일로 보낸다.
// 3. 복사 시간을 잰다.

public class Quiz01 {

	public static void main(String[] args) {
		
		BufferedInputStream bis = null;  // Coffee.mp4파일을 읽는다.
		BufferedOutputStream bos = null;  // Coffee2.mp4파일을 생성한다.
		
		try {
		
			bis = new BufferedInputStream(new FileInputStream("Coffee.mp4"));
			bos = new BufferedOutputStream(new FileOutputStream("Coffee2.mp4"));
			
			// int 단위로 읽고 쓰기
			// int data = bis.read();
			// bos.write(data);
			
			// byte[] 단위로 읽고 쓰기
			// byte[] bytes = new byte[1024];  // 1024바이트 = 1킬로바이트
			// bis.read(bytes);
			// bos.write(bytes);
			
			long start = System.currentTimeMillis();  // 밀리초 시간
			while (true) {
				byte[] bytes = new byte[1024];
				int state = bis.read(bytes);  // Coffee.mp4파일에서 읽기
				if (state == -1) {
					break;
				}
				bos.write(bytes);  // Coffee2.mp4파일에 쓰기(생성)
			}
			long end = System.currentTimeMillis();  // 밀리초 시간
			double copyTime = (end - start) / 1000.0;  // 복사시간(초)
			
			System.out.println("파일이 복사되었습니다. 복사시간: " + copyTime + "초");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (bos != null) { bos.close(); }
				if (bis != null) { bis.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}