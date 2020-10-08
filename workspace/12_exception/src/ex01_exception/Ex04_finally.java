package ex01_exception;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
 * try{
 * 		코드 작성
 * }catch (예외처리 매개변수){
 * 		예외처리
 * }catch (예외처리 매개변수){
 * 		예외처리
 * }finally{
 * 		반드시 실행되는 코드(예외 발생과 상관 없이)
 * }
 */


public class Ex04_finally {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		try {
			System.out.print("첫 번째 정수 >>> ");
			int a = sc.nextInt();
			
			System.out.print("두 번째 정수 >>> ");
			int b = sc.nextInt();
			
			System.out.println(a + " + " + b + " = " + (a+b));
			System.out.println(a + " - " + b + " = " + (a-b));
			System.out.println(a + " * " + b + " = " + (a*b));
			System.out.println(a + " / " + b + " = " + (a/b));
						
		}catch(InputMismatchException ie) {
			System.out.println("정수만 입력할 수 있습니다.");
		}catch(ArithmeticException ae) {
			System.out.println("수행할 수 없는 연산입니다.");
		}catch(Exception e) {
			System.out.println("문제가 발생하였습니다. 다시 시도하세요.");
		}finally {
			if(sc != null) {
				sc.close();							
			}
		}


	}

}
