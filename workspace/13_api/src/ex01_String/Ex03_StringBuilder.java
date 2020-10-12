package ex01_String;

public class Ex03_StringBuilder {

	public static void main(String[] args) {
		// StringBuilder 클래스
		// 1. StringBuffer와 같은 역할이다.
		
		// 2. Single-Thread 환경에서만 사용할 수 있다.
		
		// 1. StringBuilder 생성
		StringBuilder sb = new StringBuilder();
		
		// 2. 문자열 추가
		sb.append("hello");
		
		// 3. 출력
		System.out.println(sb);
		
	}

}
