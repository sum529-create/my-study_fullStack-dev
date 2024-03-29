package ex02_variable;

public class Ex02_primitive_type {
	
	// main의 자동 완성
	// main 입력 후 ctrl + spacebar
	

	public static void main(String[] args) {
		/*
		 * 기본 자료형 (primitive type)
		 * - 값을 저장할 수 있는 자료형
		 * 
		 * 1. 정수 타입
		 * 		1) byte
		 * 			(1) 크기 : 1byte (8bit)
		 * 			(2) 개수 : 2의 8제곱 (256개)
		 * 			(3) 범위 : -128 ~ 127 (-2의 7제곱 ~ 2의 7제곱 - 1)
		 * 			(4) 용도 : 이미지, 동영상 등을 그대로 저장하기 위한 byte 배열
		 * 		2) short
		 * 			(1) 크기 : 2byte
		 * 			(2) 개수 : 2의 16제곱 (65,536개)
		 * 			(3) 범위 : -32,768 ~ 32,767
		 * 			(4) 용도 : 엣날 코드 호환용
		 * 		3) int
		 * 			(1) 크기 : 4byte
		 * 			(2) 개수 : 2의 32제곱 (4,294,967,296개)
		 * 			(3) 범위 : -2,147,483,648 ~ 2,147,483,648
		 * 			(4) 용도 : 일반적인 정수 저장용
		 * 		4) long
		 * 			(1) 크기 : 8byte
		 * 			(2) 개수 : 2의 64제곱
		 * 			(3) 범위 : - ~ 
		 * 			(4) 용도 : int보다 크거나 작은 정수용
		 * 			(5) 주의 : int money = 3000000000; 처리 안됨
		 * 						long money = 3000000000; 처리 안됨
		 * 						long money = 3000000000L; 접미사(suffix) L을 붙여야 long 타입 리터럴이다.
		 * 
		 * 2. 실수
		 * 		1) float
		 * 			(1) 크기 : 4byte
		 * 			(2) 용도 : 옛날 코드 호환용
		 * 			(3) 주의 : 접미사(suffix) F를 붙여야 float타입 리터럴이다.
		 * 		2) double
		 * 			(1) 크기 : 8byte
		 * 			(2) 용도 : 일반적인 실수 저장용
		 * 
		 * 3. 문자타입
		 * 		1) char
		 * 			(1) 크기 : 2byte (유니코드 : 전 세계 모든 문자 저장)
		 * 			(2) 문자 표현 코드 : 
		 * 				- ASCII : 1바이트 영문 표준 코드
		 * 				- UNICODE : 2바이트 국제 표준 코드
		 * 4. 논리타입
		 * 		1) Boolean
		 * 			(1) 크기 : 이론상 1Bit
		 * 			(2) 용도 : 조건식의 참, 거짓 처리 용도
		 * 			(3) 참 : true
		 * 			(4) 거짓 : false
		 * 
		 * 			
		 */
		
		long money = 3000000000L;
		System.out.println(money);
		
		double pi = 3.142592;
		System.out.println(pi);
		
		char ch = '한';
		System.out.println(ch);
		
		boolean isBig = true;
		System.out.println(isBig);
		
		

	}

}
