package ex02_quiz;

import java.util.Random;

public class Quiz01 {

	public static void main(String[] args) {
		
		// 문제. 주사위 던지기
		// 1 ~ 6 사이의 임의의 숫자를 출력하시오.
		
		Random rand = new Random();
		
		int num = rand.nextInt(6)+1;
		System.out.println("임의의 주사위 수 : " + num);
		
	}
}
