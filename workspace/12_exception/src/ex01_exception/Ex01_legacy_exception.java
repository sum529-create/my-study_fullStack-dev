package ex01_exception;

/*
 * 고전 예외처리 방법의 단점
 * 1. 개발자의 역량에 따라 처리가 다르다.
 *    개발자가 이미 문제점을 예상하고 있어야 한다.
 * 2. 예상못한 문제점에 대비책이 전혀 없다.
 */

import java.util.Scanner;

public class Ex01_legacy_exception {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("첫 번째 정수 >>> ");
		int a = sc.nextInt();
		
		System.out.print("두 번째 정수 >>> ");
		int b = sc.nextInt();

		if(b == 0) {
			System.out.println("0으로 나눌 수 없습니다.");
		}else {			
			System.out.println(a + "+" + b + "=" + (a+b));
			System.out.println(a + "-" + b + "=" + (a-b));
			System.out.println(a + "*" + b + "=" + (a*b));
			System.out.println(a + "/" + b + "=" + (a/b));
		}
		
		sc.close();
	}

}
