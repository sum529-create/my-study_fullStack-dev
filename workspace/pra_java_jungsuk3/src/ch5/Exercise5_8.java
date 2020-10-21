package ch5;

public class Exercise5_8 {

	public static void main(String[] args) {
		
		int[] answer = { 1, 4, 4, 3, 1, 4, 4, 2, 1, 3, 2 };
		int[] counter = new int[4];
		for (int i = 0; i < answer.length; i++) {
			/* (1) 알맞은 코드를 넣어 완성하시오. */
			
			counter[answer[i]-1]++;
			/*
			 * i = 0;
			 * answer[0] = 1
			 * counter[1-1]
			 * counter[0]++  -> 자릿수 1더하기
			 * ...
			 * '-1' => answer의 값에 4 값이 있어서
			 */
			
		}
		for (int i = 0; i < counter.length; i++) {
			/* 알맞은 코드를 넣어 완성하시오 (2) . */
			System.out.print(counter[i]);
			for(int j =0; j < counter[i]; j++) {
				System.out.print("*");
			}
			
			System.out.println();
		}

	}

}
