package ex01_inheritance;

// 상속관계 구현하는 상황
// 1. is - a 관계
// 2. has - a 관계

// is - a 관계
// X is a Y : X는 Y이다.

// EV is a Car : EV는 Car이다.
// 슈퍼클래스 : Car
// 서브클래스 : EV


// 슈퍼클래스
class Car{
	
	// method
	void drive() {
		System.out.println("Car's drive()");
		
	}
	
}

// 서브클래스
class EV extends Car{
	// method
	void charge() {
		System.out.println("EV's charge()");
	}
}


public class Ex02_is_a {

	public static void main(String[] args) {
		
		// 슈퍼클래스
		Car car = new Car();
		car.drive();
		
		// 서브클래스
		EV ev = new EV();
		ev.charge();
		ev.drive();

	}

}
