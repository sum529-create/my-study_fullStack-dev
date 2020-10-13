package ex03_Object;

public class Ex02_toString {

	public static void main(String[] args) {
		
		Integer money = 1000000;
		// money 글자 수 출력하기
		// 글자 수 : String 클래스의 length()메소드
		// money를 String으로 바꾼 뒤 length() 메소드를 호출한다.
		int len = money.toString().length();
		System.out.println(len);
	}

}
