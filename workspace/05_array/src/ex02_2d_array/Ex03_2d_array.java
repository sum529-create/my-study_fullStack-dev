package ex02_2d_array;

public class Ex03_2d_array {

	public static void main(String[] args) {
		
		/*
		 * 가변형 2차원 배열
		 * 1. 가변형이란 각 행 마다 열의 개수가 다른 2차원 배열
		 * 2. 선언 방법
		 * 		int[][] a = new int[3][];	// 3행 n열
		 * 		a[0] = new int[1];	// 0행에는 1개열이 있다.
		 * 		a[1] = new int[2];	// 1행에는 2개열이 있다.
		 * 		a[2] = new int[3];	// 2행네느 3개열이 있다.
		 */
		
		// 가변형 2차원 배열의 선언
		int[][] a = new int[3][];
		a[0] = new int[1];
		a[1] = new int[2];
		a[2] = new int[3];
		
		for(int i=0; i<a.length; i++) {
			for(int j = 0; j<a[i].length; j++) {
				System.out.print(a[i][j] + "\t");
			}
			System.out.println();
		}

	}

}
