package ex01_array;

import java.util.Scanner;

public class Ex02_forEach {

	public static void main(String[] args) {
		
		// 일반 for문
		// for (int i = 0; i<a.length; i++)
		// 		배열 요소 : a[i]
		
		// 향상 for문
		// for (int n : a)
		// 		배열 요소 : n
		
		int[] a = new int[5];
		
		// 향상 for문 (for-each)
		for(int n : a) {
			System.out.println("배열 요소 : " + n);
		}
		
		// 향상 for문으로 배열에 데이터 저장
//		for (int n : a) {
//			n = 10;		// 배열 요소에 10을 저장
//		}
		
		// 저장 유무 확인
		for (int n : a) {
			System.out.println("배열 요소 : " + n);
		}
		
		// 배열 요소의 읽기용 : 향상 for문
		// 배열 요소의 쓰기용 : 일반 for문
				
		// 문제. 취미를 3개 입력받아서,
		// hobbies 배열에 저장하고 출력
		
		Scanner sc = new Scanner(System.in);
		
		String[] hobbies = new String[3];
		
		for(int b=0; b<hobbies.length; b++) {
			System.out.print((b+1) + "번째 취미를 입력하세요 >> ");
			hobbies[b] = sc.next();
		}
		for(String n : hobbies) {
			System.out.println(n);
		}
		
		sc.close();
		


	}

}
