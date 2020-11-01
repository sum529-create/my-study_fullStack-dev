package ch9;

class Exercise9_7 { 

	

	/* (1) contains 메서드를 작성하시오 . */
	public static boolean contains(String src, String target) {
		if(src.contains(target) == true) {
			return true;
		}
		return false;
		// return src.indexOf(target) != -1;
	}
	

	public static void main(String[] args) {

		System.out.println(contains("12345", "23"));

		System.out.println(contains("12345", "67"));

	}

}