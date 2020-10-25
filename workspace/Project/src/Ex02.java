import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("수 입력 : " );
		int a = sc.nextInt();
		int sum1 = 0, sum2 = 0;
		
		for(int su = 1; su <= a; su++) {
			if(su%2 == 0) {
				sum1 += su;
			}else {
				sum2 +=su;
			}
				
		}
		
		System.out.println("홀수합계 : " + sum2);
		System.out.println("짝수합계 : " + sum1);
		

	}

}
