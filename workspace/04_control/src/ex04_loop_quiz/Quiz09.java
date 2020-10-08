package ex04_loop_quiz;

public class Quiz09 {

	public static void main(String[] args) {
		
		// 문제. 구구단의 일부만 출력하시오.
		// 2 x 1 = 2
		// ...
		// 4 x 4 =16
		
		for(int a= 2; a < 10; a++) {
			int b;
			for(b = 1; b < 10; b++) {
				System.out.println(a + "x" + b + "=" + (a*b));
				if (a == b && b == 4) {
					break;
				}
			}
			if (a == b && b == 4) {
				break;
			}
			System.out.println("-------------");
		}

	}

}
