package ch4;

public class Exercise4_14 {

	public static void main(String[] args) {
		//  1~100 answer . 
		
		int answer = (int)(Math.random()*100)+1;
		int input = 0; 
		int count = 0;
		
		java.util.Scanner s = new java.util.Scanner(System.in); 
		
		do {
			count++;
			System.out.print("1과 100사이의 값을 입력하세요 :"); 
			input = s.nextInt();
			
			if(answer == input) {
				System.out.println("맞췄습니다."); break;
			}else if(answer >= input){
				System.out.println("더 큰 수를 입력하세요.");
			}else if(answer <= input) {
				System.out.println("더 작은 수를 입력하세요.");
			}
			
		} while(true); 
		System.out.println("시도횟수는 " + count + "번입니다.");
		
		s.close();
	}

}
