package ex03_loop;

public class Ex04_nested_loop {

	public static void main(String[] args) {
		
		// 1일차 1교시 입니다.
		// 1일차 2교시 입니다.
		// ...
		// 5일차 8교시 입니다.
		
		for(int a = 1;a<=5;a++) {	// outer loop
			for(int b=1; b<=8; b++) {	// inner loop
				System.out.println(a + "일차 " + b + "교시 입니다.");
			}
			System.out.println("-------------------");
		}
		

	}

}
