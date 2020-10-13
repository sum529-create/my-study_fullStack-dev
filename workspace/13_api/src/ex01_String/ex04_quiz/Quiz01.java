package ex04_quiz;

import java.util.Scanner;

public class Quiz01 {
	// static 메소드 (클래스, 메소드)는
	// static 메소드 + static 필드만 호출할 수 있다.
	
	// inputFullName 메소드
	// 실행 예)
	// 성(lastName)을 입력하세요 >> james
	// 이름(firstName)을 입력하세요 >> dean
	// james dean을 반환하는 메소드로 구현하시오.
	// 반드시 StringBuffer 클래스를 사용하시오.
	
	// field
	private static Scanner sc = new Scanner(System.in);
	
	// method
	public static String inputFullName() {
		System.out.print("성(lastName)을 입력하세요 >> ");
		String lastName = sc.next();
		System.out.println("이름(firstName)을 입력하세요 >> ");
		String firstName = sc.next();
		// return lastName + " " + firstName;
		StringBuffer sb = new StringBuffer();
		sb.append(lastName).append(" ").append(firstName);
		return sb.toString(); // StringBuffer -> String
		
	}

	public static void main(String[] args) {
		String fullName1 = inputFullName();		// inputFullName() 메소드는 static
		String fullName2 = inputFullName();
		System.out.println("성명1: " + fullName1);
		System.out.println("성명2: " + fullName1);
		if(fullName1.equals(fullName2)) {
			System.out.println("같은 이름입니다.");
		}else {
			System.out.println("다른 이름입니다.");
		}
		
	}

}
