package ex03_method;

class Nemo{
	
	int height;
	int weight;
	
	void setInfo(int x, int y) {
		height = x;
		weight = y;
	}
	void setInfo(int x) {	// 매개변수가 달라야 사용이 가능하다. 결과타입(int, double .. )은 상관없다..
		setInfo(x, x);
		
	}
	void info() {
		System.out.println("너비 : " + height + ", 높이 : " + weight);
	}
	int getArea() {
		int sum = height * weight;
		return sum;
	}
	
}


public class Ex04_method_overloading {

	public static void main(String[] args) {
		
		// 사각형 만들기
		
		// 1. 직사각형
		Nemo nemo1 = new Nemo();
		nemo1.setInfo(3, 5);
		System.out.println("넓이 : " + nemo1.getArea());	// 넓이 : 15
		nemo1.info();	// 너비 : 3, 높이 : 5
		
		System.out.println();
		
		// 2. 정사각형
		Nemo nemo2 = new Nemo();
		nemo2.setInfo(3);
		System.out.println("넓이 : " + nemo2.getArea()); 	// 넓이 : 9
		nemo2.info();
	}

}
