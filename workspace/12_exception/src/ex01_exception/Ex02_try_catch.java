package ex01_exception;

import java.util.Scanner;

/*
 * try{
 * 		코드 작성
 * }catch (예외처리 매개변수){
 * 		예외처리
 * }
 * 
 * 예외 클래스
 * 1. 모든 Exception을 처리할 수 잇는 클래스
 * 2. RuntimeException, IOException, NullPointException 등 많은 클래스가 있다.
 * 3. 모든 예외는 'Exception 클래스'를 상속한다.
 * 
 */

public class Ex02_try_catch {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		try {
			System.out.print("첫 번째 정수 >>> ");
			int a = sc.nextInt();
			
			System.out.print("두 번째 정수 >>> ");
			int b = sc.nextInt();
			
			System.out.println(a + "+" + b + "=" + (a+b));
			System.out.println(a + "-" + b + "=" + (a-b));
			System.out.println(a + "*" + b + "=" + (a*b));
			System.out.println(a + "/" + b + "=" + (a/b));
						
			sc.close();
		}catch(Exception e) {
			System.out.println("문제가 발생하였습니다. 다시 시도하세요.");
		}
		

	}

}
