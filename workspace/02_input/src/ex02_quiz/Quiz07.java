package ex02_quiz;

import java.util.Scanner;

public class Quiz07 {

	public static void main(String[] args) {
		
		// 문제. 온도 변환기
		// 섭씨 온도를 입력하면 해당 화씨 온도를 출력하시오.
		// 화씨 = 섭씨 * 1.8 + 32
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("섭씨 온도를 입력하시오 >> ");
		double te = sc.nextDouble();
		
		System.out.println("화씨 온도는 " + (te * 1.8 +32) + "입니다.");
		
		sc.close();

	}

}
