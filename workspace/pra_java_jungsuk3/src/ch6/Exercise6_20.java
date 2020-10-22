package ch6;

public class Exercise6_20 {

	/* 

	 *  (1) shuffle 메서드를 작성하시오. 

	 * */
	
	private static int[] shuffle(int[] arr) {
		
		if(arr == null || arr.length == 0) {
			return arr;
		}
		
		int rand = (int)(Math.random()*arr.length);
		for(int i =0; i<arr.length; i++) {			
			int temp = arr[i];
			arr[i] = arr[rand];
			arr[rand] = temp;
		}
		
		return arr;
	}

	

	public static void main(String[] args) {

		int[] original = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

		System.out.println(java.util.Arrays.toString(original));



		int[] result = shuffle(original);

		System.out.println(java.util.Arrays.toString(result));

	}

}
