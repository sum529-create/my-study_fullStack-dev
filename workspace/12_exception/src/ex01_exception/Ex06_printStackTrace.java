package ex01_exception;

public class Ex06_printStackTrace {

	public static void main(String[] args) {
		
		// 1. 개발 중 : e.printStackTrace()
		// 2. 개발 완료 : 적절한 예외 처리로 수정해 줄 것
		
		try {
			System.out.println(2 / 0);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
