package ex01_random;

import java.util.Random;

public class Ex01_Random {

	public static void main(String[] args) {
		
		// java.util.Random
		Random rand = new Random();
		
		int rand1 = rand.nextInt();
		int rand2 = rand.nextInt(10);
		
		System.out.println("int 범위 중 하나 : " +  rand1);
		System.out.println("10개 정수 중 하나 : " + rand2);
		
		double rand3 = rand.nextDouble();
		System.out.println("0 ~ 1 사이의 실수 : " + rand3);
	}

}
