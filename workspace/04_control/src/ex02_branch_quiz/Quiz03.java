package ex02_branch_quiz;

import java.util.Scanner;

public class Quiz03 {

	public static void main(String[] args) {
		// 문제. 나이(0이상 ~ 130이하)를 입력 받아서
		// 7세 이하 "미취학"
		// 13세 이하 "초등학생"
		// 16세 이하 "중학생"
		// 19세 이하 "고등학생"
		// 20세 이상 "성인"
		// 나머지 "불가능한 나이"
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("나이를 입력하세요. >> ");
		int age = sc.nextInt();
		
		if (age <= 7) {
			System.out.println("미취학");
		}else if(age <= 13) {
			System.out.println("초등학생");
		}else if(age <= 16) {
			System.out.println("중학생");
		}else if(age <= 19) {
			System.out.println("고등학생");
		}else if(age >= 20 && age <= 130) {
			System.out.println("성인");
		}else {
			System.out.println("불가능한 나이");
		}
		
		sc.close();

	}

}
