package ex01_byte_base;


import java.io.BufferedInputStream;
import java.io.FileInputStream;

public class Ex06_BufferedInputStream {

	public static void main(String[] args) {
		
		BufferedInputStream bis = null;
		
		try {
			
			bis = new BufferedInputStream(new FileInputStream("second.txt"));
			
			StringBuffer sb = new StringBuffer();
			
			while (true) {
				byte[] bytes = new byte[10];
				int state = bis.read(bytes);
				if (state == -1) {
					break;
				}
				sb.append(new String(bytes));
			}
			
			System.out.println(sb.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (bis != null) {
					bis.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}










