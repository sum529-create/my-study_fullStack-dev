package ex01_byte_base;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

public class Ex10_ObjectInputStream {

	public static void main(String[] args) {
		
		ObjectInputStream ois = null;
		
		try {
			
			ois = new ObjectInputStream(new BufferedInputStream(new FileInputStream("user.dat")));
			
			// user.dat 파일에 저장된 ArrayList<User> list 읽기
			@SuppressWarnings("unchecked")
			List<User> list = (ArrayList<User>) ois.readObject();
			
			// list 확인
			for ( User user : list ) {
				user.info();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ois != null) {
					ois.close();
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
