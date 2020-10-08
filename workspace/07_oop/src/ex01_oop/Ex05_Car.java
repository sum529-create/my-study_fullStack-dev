package ex01_oop;


class Engine{
	// field
	String type;	// 가솔린, 디젤
	int cc;			// 배기량
	int hp;			// 마력	
	
	// constructor
	
	public Engine(String type, int cc, int hp) {
		this.type = type;
		this.cc = cc;
		this.hp = hp;
	}
	
	// method
	void info() {
		System.out.println(type + ", " + cc + ", " + hp);
	}
	
}
class Car{
	// field
	String model;
	Engine engine;
	double fuelEfficiency;	// 연비
	
	// constructor
	
	public Car(String model, double fuelEfficiency, Engine engine) {
		this.model = model;
		this.fuelEfficiency = fuelEfficiency;
		this.engine = engine;
	}

	// method
	void info() {
		System.out.print(model + ", " + fuelEfficiency + ", ");
		engine.info();
	}
}

public class Ex05_Car {

	public static void main(String[] args) {

		// 2개의 자동차를 생성하시오.
		Car car1 = new Car("k5", 150.54, new Engine("가솔린", 5000, 500));
		Car car2 = new Car("k3", 100.53, new Engine("디젤", 3000, 500));
		
		car1.info();
		car2.info();
	}

}
