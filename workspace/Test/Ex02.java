package project;

import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("수 입력 : ");
		int su = sc.nextInt();
		int j = 0; int h = 0;

		for(int i = 1; i<=su; i++) {
			if(i%2 == 0) {
				j += i;
			}else {
				h += i;
			}
		}
		System.out.print("홀수합계 : " + h);
		System.out.print("짝수합계 : " + j);

	}

}
