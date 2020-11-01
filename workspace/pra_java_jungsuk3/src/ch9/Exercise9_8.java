package ch9;

public class Exercise9_8 {
	
	/* (1) round 메서드를 작성하시오 . */
	public static double round(double b, int n) {
		double num = Math.pow(10.0, (double)n);
		return Math.round(b*num)/num;
	}
	

	public static void main(String[] args) {
		System.out.println(round(3.1415, 1));

		System.out.println(round(3.1415, 2));

		System.out.println(round(3.1415, 3));

		System.out.println(round(3.1415, 4));

		System.out.println(round(3.1415, 5));

	}

}
