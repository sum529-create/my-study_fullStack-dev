package ch9;

class Exercise9_6 {

	public static String fillZero(String src, int length) {

		// (1) fillZero 메서드를 작성하시오 .    

		// 1. src가 널이거나 src.length()가 length와 같으면 src를 그대로 반환한다.   
		if(src == null || src.length() == length) {
			return src;
		}
		
		// 2. length의 값이 0보다 같거나 작으면 빈 문자열("")을 반환한다.    
		else if(length <= 0) return "";
		
		// 3. src의 길이가 length의 값보다 크면 src를 length만큼 잘라서 반환한다.   
		else if(src.length() > length) {
			return src.substring(0, length);
		}

		
		// 4. 길이가 length인 char배열을 생성한다.    
		char[] chArr = new char[length];
		
		// 5. 4에서 생성한 char배열을 '0'으로 채운다.      
		for(int i = 0 ; i<chArr.length; i++) {
			chArr[i] = '0';
		}
		
		
		// 6. src에서 문자배열을 뽑아내서 4에서 생성한 배열에 복사한다.    
		System.arraycopy(src.toCharArray(),0,chArr, length - chArr.length, src.length());
		
		
		
		// 7. 4에서 생성한 배열로 String을 생성해서 반환한다. 
		
		return new String(chArr); 

		}

	

	public static void main(String[] args) {

		String src = "12345";

		System.out.println(fillZero(src, 10));

		System.out.println(fillZero(src, -1));

		System.out.println(fillZero(src, 3));

	}

}