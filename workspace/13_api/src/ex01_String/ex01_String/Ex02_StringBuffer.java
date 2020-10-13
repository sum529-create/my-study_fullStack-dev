package ex01_String;

public class Ex02_StringBuffer {

	@SuppressWarnings("unlikely-arg-type")
	public static void main(String[] args) {
		// StringBuffer 클래스
		// 1. String을 처리하는 내부 Buffer를 가지고 있다.
		// 2. String에 비해 성능이 좋다.
		// 3. Multi Thread 환경에서 사용할 수 있다
		
		// 1. StringBuffer 객체 생성
		StringBuffer sb = new StringBuffer();
		
		// 2. 문자열 추가
		sb.append("hello");
		sb.append(" java");
		sb.append(" world");
		
		// 3. 출력
		System.out.println(sb); 	// hello java world
		
		// 4. 동등비교
		// 1) StringBuffer는 equals 메소드로 동등비교가 안 된다.
		System.out.println(sb.equals("hello java world"));  	// false sb는 String이 아님
		// 2) String으로 변경해야 equals 메소드로 동등비교를 할 수 있다.
		System.out.println(sb.toString().equals("hello java world"));
	}

}
