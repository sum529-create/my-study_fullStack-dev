package ex02_variable;

public class Ex04_casting {

	public static void main(String[] args) {
		/*
		 * 타입 변환 - 형 변환	= casting
		 * 
		 * 1. 자동 타입 변환
		 * 		1) java가 스스로 타입을 변환
		 * 		2) 작은 크기 -> 큰 크기
		 * 		3) 정수와 실수의 연산 -> 정수를 실수로 자동 타입 변환 후에 연산
		 * 
		 * 2. 강제 타입 변환
		 * 		1) 개발자가 직접 타입을 변환
		 * 		2) 크기 상관 없이 무조건 변환
		 * 		3) 사용 방법
		 * 			(타입)변수
		 */
		
		System.out.println(1 + 1.5);
		
		int a = 1;
		int b = 2;
		System.out.println(a / b); 	// a와 b중 하나을 강제로 실수 타입을 변경하면 나눗셈 연산 가능
		System.out.println((double)a / b);	// a를 double로 강제 변환 (casting)
		
		// a는 casting 당시에만 잠시 타입이 변경
		
	}

}
