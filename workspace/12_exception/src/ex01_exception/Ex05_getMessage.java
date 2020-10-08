package ex01_exception;

public class Ex05_getMessage {

	public static void main(String[] args) {
		
		// getMessage()
		// 1. 예외의 메시지를 반환하는 메소드
		// 2. 이미 작성된 예외 메시지를 확인
		// 3. 개발자가 정의한 예외 메시지를 확인
		
		
		try {
			int[] a = new int[5];
			System.out.println(a[10]);	// ArrayOutOfBoundsException
			Integer.parseInt("1.5");	// NumberFormatException
			System.out.println(2 / 0);	// ArithmeticException
			
			
		}catch(Exception e) {
			// 예외 메시지 확인
			System.out.println(e.getMessage());
		}
		

	}

}
