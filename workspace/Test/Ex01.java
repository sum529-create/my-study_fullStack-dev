package project;

import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("지방의 그램을 입력하세요 : ");
		int fat = sc.nextInt();
		
		System.out.print("탄수화물의 그램을 입력하세요 : ");
		int carbohydrate = sc.nextInt();
		
		System.out.print("단백질의 그램을 입력하세요 : ");
		int protein = sc.nextInt();
		
		int sum = fat * 9 + protein * 4 + carbohydrate * 4;
		
		System.out.printf("총칼로리 : %,3d cal" ,sum);
		
	}

}
