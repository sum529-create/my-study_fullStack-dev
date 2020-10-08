package choosuk;

import java.util.Scanner;

class RandomGenerator{
	int[] a;
	
	RandomGenerator(int length){
		this.a = new int[length];
		for(int i=0; i<a.length; i++) {
			a[i] = (int)(Math.random()*100)+1;
			for(int j=i-1; j>=0; j--) {
				if(a[i] == a[j]) {
					i--;
					break;
				}
			}
		}
		
	}
	void info() {
		for(int i = 0; i<a.length; i++) {
			if(i % 5 == 0) {
				System.out.println();
			}
			System.out.print(a[i] + "\t");
		}
	}
}

public class Ex05 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("배열의 길이를 입력하세요 >> ");
		int length = sc.nextInt();
		
		RandomGenerator rg = new RandomGenerator(length);
		rg.info();

		
		sc.close();
	}

}
