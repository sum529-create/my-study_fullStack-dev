package ex01_byte_base;


import java.io.FileInputStream;

// try-catch-resources
// 1. close() 메소드를 자동으로 호출하는 try문
// 2. 형식
//    try (스트림 생성) {
//    
//    } catch () {
//
//    }

public class Ex03_try_catch_resources {

	public static void main(String[] args) {
		
		try (FileInputStream fis = new FileInputStream("first.txt")) {
			StringBuffer sb = new StringBuffer();
			while (true) {
				byte[] bytes = new byte[10];
				int state = fis.read(bytes);
				if (state == -1) {
					break;
				}
				sb.append(new String(bytes));
			}
			System.out.println(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}



