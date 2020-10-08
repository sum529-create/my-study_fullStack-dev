package ex04_constructor;

class Circle {
	
	// field
	int x;
	int y;
	double r;
	
	// constructor
	Circle(double r) {
		this(0, 0, r);  // 매개변수가 3개인 다른 생성자를 호출		
		// this.x = 0;  // 생략 가능
		// this.y = 0;  // 생략 가능
		// this.r = r;
	}
	Circle(int x, int y, double r) {
		this.x = x;
		this.y = y;
		this.r = r;
	}
	
	// method
	double getArea() {
		// 결과타입이 있으면 반드시 return문이 있어야 한다.
		return Math.PI * Math.pow(r, 2);  // pi * r * r
	}
	void info() {
		System.out.println("중심좌표: [" + x + ", " + y + "], 반지름: " + r);
	}
	
}

public class Ex04_Circle {

	public static void main(String[] args) {
		
		Circle circle1 = new Circle(1.5);
		Circle circle2 = new Circle(1, 2, 1.5);
		
		System.out.println("circle1의 크기: " + circle1.getArea());
		System.out.println("circle2의 크기: " + circle2.getArea());
		
		circle1.info();  // 중심좌표: [0, 0], 반지름: 1.5
		circle2.info();  // 중심좌표: [1, 2], 반지름: 1.5

	}

}
