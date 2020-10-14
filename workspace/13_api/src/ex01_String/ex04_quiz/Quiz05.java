package ex04_quiz;

class User{
	private String userId;
	private String userPw;
	
	public User(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("아이디 : ").append(userId.substring(0, 2));
		for(int i=0; i<userId.length()-2;i++) {
			sb.append("*");
		}
		sb.append(", 비밀번호 : ");
		for(int i=0; i<userPw.length();i++) {
			sb.append("*");
		}
		return sb.toString();
	}
	
	
}

public class Quiz05 {

	public static void main(String[] args) {
		
		User user = new User("admin", "123456");
		System.out.println(user.toString());	// 아이디 : ad***, 비밀번호 : ******	(글자수맞추기)
		
		
		
	}

}
