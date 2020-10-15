package ex05_quiz;

import java.util.*;

// 문제. 임의의 User를 3명 저장하는 ArrayList를 생성하시오.
// 회원번호를 입력 받아 검색하여 일치하는 회원을 삭제하시오.

class User{
	// field
	private int no;		// 회원번호 
	private String id;	// 아이디
	@SuppressWarnings("unused")
	private Date date;	// 가입일
	
	public User(int no, String id, Date date) {
		super();
		this.no = no;
		this.id = id;
		this.date = date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	// toString() 클래스 오버라이드
	@Override
	public String toString() {
		return id + " " + no + " " + date;
	}
	
}

public class Quiz01 {

	public static void main(String[] args) {
		
		Date date = new Date();
		List<User> lUser = new ArrayList<User>();
		lUser.add(new User(111, "id1", date));
		lUser.add(new User(222, "id2", date));
		lUser.add(new User(333, "id3", date));
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("삭제할 회원번호를 입력하시오 >> ");
		int no = sc.nextInt();
		int removeIndex = -1;	// 0으로 지정시 자동으로 0번째 배열이 삭제됨
		
		// 저장된 User의 no와 입력된 no비교
		for(int i=0, size = lUser.size(); i<size; i++) {
			if(lUser.get(i).getNo() == no) {	// lUser.get()  -> no, id, date불러올수 있음
				// 해당 인덱스(i)User 삭제하기 위해서 인덱스 저장해 두기
				removeIndex = i;
			}
		}
		if(removeIndex != -1) {			
			lUser.remove(removeIndex);
		}

		// 개별 객체 정보를 문자열로 반환하는 toString 메소드를 함께 활용
		
		// 1) toString() 오버라이드 전이라면 Object 클래스의 toString()메소드가 동작한다.
		// System.out.println(lUser);	// [객체, 객체, 객체]
		
		// 2) toString() 오버라이드 이후라면 User클래스의 toString()메소드가 동작한다.
		System.out.println(lUser);	// [아이디, 아이디, 아이디]
		
		sc.close();
	}

}
