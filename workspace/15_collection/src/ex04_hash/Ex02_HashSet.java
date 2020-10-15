package ex04_hash;

import java.util.HashSet;
import java.util.Set;

class Member{
	private String id;

	public Member(String id) {
		super();
		this.id = id;
	} 
	
	// hashCode() 메소드를 만들면 Object클래스의 hashCode()메소드는 사용되지 않는다.
//	@Override
//	public int hashCode() {
//		// return 1;	// 모든 Member는 해시값이 1이므로 같은 Member일 가능성이 있다고 판단한다.(최악)
//		// return id.length();		// id의 글자수가 같으면 같은 Member일 가능성이 있다고 판단한다.
//		return id.charAt(0);	// id의 첫번째 글자가 같으먼 같은 Member일 가능성이 있다고 판단한다.
//	}
	
	
	// 이클립스에서 제공하는 hashCode 단축키
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}

public class Ex02_HashSet {

	public static void main(String[] args) {
		
		// HashSet 클래스는 중복 저장이 불가능하다.
		// 중복 체크 방법
		// 1단계. hashCode 값을 비교한다. (같은 hashCode이면 같은 객체일 가능성이 있다.
		// 2단계. equals로 비교한다.
		
		Member m1 = new Member("abc");
		Member m2 = new Member("abc");
		
		Set<Member> set = new HashSet<Member>();
		
		set.add(m1);
		set.add(m2);	// 둘다 hashCode가 1으로 되어 있어 둘이 같은 값일 수 있다라는 것을 볼 수 있다. 
		
		System.out.println(set);
			
	}

}
