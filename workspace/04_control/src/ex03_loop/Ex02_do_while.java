package ex03_loop;

import java.util.Scanner;

public class Ex02_do_while {

	public static void main(String[] args) {
		
		// do ~ while문
		// 1. 본문을 반드시 한 번은 실행하는 while문
		// 2. 형식
		// 	  do {
		//			반복 실행문;
		//	  }
		// 	  while(조건식);

		int n = 0;
		int total = 0;
		
		Scanner sc = new Scanner(System.in);
		
		do {
			System.out.print("더할 값을 입력하세요 >>> ");
			n = sc.nextInt();
			total += n;
		} while (n != 0);
		
		System.out.println("합계 : " + total);
		
		sc.close();
	}

}
