package ex02_api;

/*
 * Wrapper Class
 * 1. 기본자료형 -> 참조자료형으로 변경해주는 클래스이다.
 * 2. 종료
 * 		1) int	-> Integer
 * 		2) double -> Double
 * 		3) char -> Character
 * 3. 변수를 객체로 변경해준다.
 * 4. 변수와 객체는 자동으로 상호변환된다.
 * 		1) Auto Boxing : 변수 -> 객체
 * 		2) Auto UnBoxting : 객체 -> 변수
 * 5. 언제 사용하는가? 반드시 참조자료형을 요구할 때 사용한다.
 */

public class Ex02_Wrapper_Class {

	public static void main(String[] args) {

		Integer a = 10;		// Auto Boxing
		Integer b = new Integer(20);
		Integer c = new Integer("30");
		
		int total = a + b  + c;		// Auto UnBoxing
		System.out.println(total);
	}

}
