package ex04_loop_quiz;

public class Quiz11 {

	public static void main(String[] args) {
		
		// 문제. 369게임
		// 1 ~ 99 사이 369게임 결과 출력하기
		// 1	2	짝	4	5	짝	7	8	짝	10
		
		// 0은 false를 의미하고, 1은 True를 의미한다.
		
		boolean condition1 = false;		// 일의 자리가 3,6,9 인가?
		boolean condition2 = false;		// 십의 자리가 3,6,9 인가
		
		
		for(int a = 1; a<100; a++) {
			
			// 일의 자리, 십의 자리 분리
			int units = a % 10;
			int tens = a / 10;
			
			condition1 = units == 3 || units == 6 || units == 9;
			// condition1 = units % 3 == 0 && units != 0;
			
			condition2 = tens == 3 || tens == 6 || tens == 9;
			// condition2 = tens % 3 == 0 && tens != 0;
			
			//출력
			if(condition1 && condition2) {	// 둘 다 true이면
				System.out.print("짝짝\t");
			}else if (condition1 || condition2) {
				System.out.print("짝\t");
			}
	        else {
				System.out.print(a + "\t");
			}
			
			// 줄 바꿈의 시점
			// a = 10, 20, 30, 40
			
	        if (a % 10 == 0) {
	        	System.out.println();
	        }
		}

	}

}
