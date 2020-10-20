package ch4;

public class Exercise4_10 {

	public static void main(String[] args) {
		
		int num = 12345; 
		int sum = 0; 
		
		/* 알맞은 코드를 넣어 완성하시오 (1) . */ 
		while(num>0) {
			sum += num %10;
			num /= 10;
		}
		
		
		System.out.println("sum="+sum);


	}

}
