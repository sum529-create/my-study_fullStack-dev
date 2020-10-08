package ex01_basic;

public class Ex02_literal {

	public static void main(String[] args) {
		// 1. 문자 표현 방식
		// 작은 따옴표룰 사용한다. (' ')
		System.out.println('A');
		System.out.println('한');
		
		// 2. 문자열 표현 방식
		// 큰 따옴표를 사용한다. (" ")
		System.out.println("Hello");
		
		// 3. 정수나 실수 표현 방식
		// 그냥 입력한다.
		System.out.println(100);
		System.out.println(3.14);
		
		// 4. 논리 표현 방식
		// true, false
		System.out.println(true);
		System.out.println(false);
		
		// 5. 이스케이프 시퀀스
		// 일종의 특수문자 개념
		// 백슬래쉬(\)로 시작
		// 1) \n : 줄 바꿈(enter)
		// 2) \t : 탭(tab)
		// 3) \' : 작은 따옴표
		// 4) \" : 큰 따옴표
		System.out.println("Hello\nWorld");
		System.out.println("Hello\tWorld");
		System.out.println("Hello\'World\'");
		System.out.println("Hello\"World\"");
		
		
		

	}

}
