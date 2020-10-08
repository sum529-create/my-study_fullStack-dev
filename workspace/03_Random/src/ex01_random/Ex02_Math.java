package ex01_random;

public class Ex02_Math {

	public static void main(String[] args) {
		
		// Math.random(); : 0 ~ 1 사이 실수
		// 0.0 <= Math.random() < 1.0
		
		// 확률. 30% 확률로 비가 온다. 나머지 확률로 비가 안 온다.
		System.out.println(Math.random() <= 0.3 ? "비가 온다." : "비가 안 온다.");
		
		// 난수 값. 1~6 사이의 주사위
		// Math.random() : 0 이상 1 미만
		// Math.random() : 0 이상 1 미만
		// (int)(Math.random()*6) : 0 이상 6 미만의 정수
		// (int)(Math.random()*6) + 1 : 1이상 7미만의 정수
		
		System.out.println((int)(Math.random()*6) + 1);
		
		// 원하는 난수 범위  : (int)(Math.random() * 개수) + 시작값

	}

}
