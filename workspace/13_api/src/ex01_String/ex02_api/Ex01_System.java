package ex02_api;

import java.util.Arrays;

public class Ex01_System {

	public static void main(String[] args) {
		
		// 1. 시스템 현재 시간 밀리초 단위로 반환
		// 		1970년 1월 1일 이후로 측정
		System.out.println("현재 시간 : " + System.currentTimeMillis() + "밀리초(1/1000초)");
		
		// 2. 시스템 현재 시간 나노초 단위로 반환
		//		자바가 결정한 어느 시점 이후로 측정
		//		측정용으로 사용
		System.out.println("현재 시간 : " + System.nanoTime() + "나노초(1/10억초)");
		
		
		// 3. 배열 복사
		int[] src = {1 ,2 ,3 ,4 ,5};
		int[] dest = new int[10];
		
//		for(int i=0; i<src.length; i++) {
//			dest[i+2] = src[i];
//			System.out.print(dest[i] + "\t");
//		
//		}
		
		// src[0]를 dest[2]으로 복사 시작, 복사하는 요소는 src.length 만큼이다.
		System.arraycopy(src, 0, dest, 2, src.length);
		System.out.println(Arrays.toString(dest));
		
		// 4. 시스템 종료
//		System.exit(0);
		
		// 문제. i++를 20억번 실행하는데 걸리는 시간을 초 단위로 출력해볼것
		long start = System.nanoTime();
		// i++ 20억번 실행
		for(int i=0; i<2000000000; i++);
		// 종료 후 시간 측정
		long end = System.nanoTime();
		// 종료시간 - 시작시간 출력
		double due = (end - start) / 1000000000.0;	// 나노초 -> 초 변경
		System.out.println("경과시간: " + due + "초");
	}

}
