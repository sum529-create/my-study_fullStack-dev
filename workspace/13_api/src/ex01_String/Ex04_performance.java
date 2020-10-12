package ex01_String;

public class Ex04_performance {

	public static void main(String[] args) {
		
		// "hello", "world" 합치기
		// 1. String str : "hello" + "world"
		// 		1) str의 메모리 : "hello world"
		// 		2) "hello"의 메모리 : "hello"
		// 		3) "world"의 메모리 : "world"
		// 2. StringBuffer sb : new StringBuffer();
		// 	  sb.append("hello").append("world");
		//	  	1) sb의 메모리 : "hello" 추가
		// 	  	2) sb의 메모리 : "world" 추가
		
		// 최근에는 String의 + 연산자도 많이 개선되었으나,
		// +연산자가 많이 사용되는 경우라면 되도록 피하자.
		
		// 1. String
		@SuppressWarnings("unused")
		String str = "";
		long start1 = System.nanoTime();// 시스템의 현재 시간(시작 전)
		for(int i =0; i<1000; i++) {	// 천개의 숫자
			str += i;					// 천번의 + 연산자 호출
			
		}
		long end1 = System.nanoTime();	// 시스템의 현재 시간(종료 후)
		System.out.println("경과시간: " + (end1 - start1) + "ns");
		
		// 동일한 작업을 StringBuffer로 진행
		
		// 2. StringBuffer
		StringBuffer sb = new StringBuffer();
		long start2 = System.nanoTime();
		for(int i=0; i<1000; i++) {
			sb.append(i);
			
		}
		long end2 = System.nanoTime();
		System.out.println("경과시간: " + (end2 - start2) + "ns");
		
	}

}
