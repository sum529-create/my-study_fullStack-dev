package ex04_loop_quiz;

import java.util.Scanner;

public class Quiz06 {

	public static void main(String[] args) {
		
		// 문제. 평점(1~5)을 3번 입력 받는다.
		// 1~5사이의 입력이 아니면 다시 입력받는다.
		
		Scanner sc = new Scanner(System.in);
		
		for(int a= 0; a<3; a++) {
			int grade;
			do {
				System.out.print((a+1) + "번째 평점 입력 >> ");
				grade = sc.nextInt();
			}while(grade < 1 || grade > 5);
		}
		
		sc.close();

	}

}
