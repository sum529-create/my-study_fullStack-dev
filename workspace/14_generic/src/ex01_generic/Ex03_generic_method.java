package ex01_generic;

public class Ex03_generic_method {
	
	// 1. generic 사용 안 하는 경우 : 메소드 오버로딩
	// public static void print(Integer[] a){}
	// public static void print(String[] a){}	
	
	// 2. generic 사용
	// 메소드에서 generic 표기 위치는 메소드 맨 앞이다.
	public static <T> void print(T[] a){// static은 static만 부를 수 있음
		System.out.print("[");
		for(int i = 0; i<a.length-1; i++) {
			System.out.print(a[i] + ", ");
		}
		System.out.println(a[a.length -1] + "]");
	}

	public static void main(String[] args) {
		Integer[] a = {1,2,3,4,5};
		String[] b = {"봄", "여름", "가을", "겨울"};
		
		print(a);	// [1,2,3,4,5]
		print(b);	// ["봄", "여름", "가을", "겨울"]
		
	}

}
