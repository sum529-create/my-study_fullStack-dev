package ex01_byte_base;


import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/*
 * ObjectOutputStream 클래스
 * 1. 객체(object)를 파일에 출력하는 클래스이다.
 * 2. 객체를 스트림으로 입출력 처리하려면 해당 객체를 직렬화해야 한다.
 * 3. 직렬화하려면 Serializable 인터페이스를 구현하면 된다.
 */

class User implements Serializable {

	/**
	 * serialVersionUID 값은 랜덤합니다.
	 */
	private static final long serialVersionUID = -3296197331300114753L;

	private String userNo;
	private int userPoint;
	
	public User(String userNo, int userPoint) {
		super();
		this.userNo = userNo;
		this.userPoint = userPoint;
	}
	
	// user 객체 출력
	// 1. System.out.println(user);  // System.out.println(user.toString());
	// 2. user.info();
	public void info() {
		System.out.println("회원번호: " + userNo + "(" + userPoint + "점)");
	}
		
}

public class Ex09_ObjectOutputStream {

	public static void main(String[] args) {
		
		ObjectOutputStream oos = null;
		
		try {
			
			oos = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream("user.dat")));
			
			// user.dat파일로 보낼 객체
			User user1 = new User("1234", 1000);
			User user2 = new User("6789", 2000);
			User user3 = new User("1357", 3000);
			
			// user.dat파일로 객체 보내기
			// 따로 보내거나, 
			// oos.writeObject(user1);
			// oos.writeObject(user2);
			// oos.writeObject(user3);
			// 합쳐서 한 번에 보낸다.
			List<User> userList = new ArrayList<User>();
			userList.add(user1);
			userList.add(user2);
			userList.add(user3);
			oos.writeObject(userList);
			
			System.out.println("user.dat파일이 생성되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (oos != null) {
					oos.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
