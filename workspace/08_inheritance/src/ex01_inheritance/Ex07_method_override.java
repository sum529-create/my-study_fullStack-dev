package ex01_inheritance;

// 슈퍼클래스
class Pizza{
	
	// field
	int cheese;		// 치즈 양
	String dough;	// 도우
	
	// constructor
	Pizza(int cheese,String dough){
		this.cheese = cheese;
		this.dough = dough;
		
	}
	
	// method
	void info() {
		System.out.println(dough + "(" + cheese + ")");
	}
	
}

// 서브 클래스
class BulgogiPizza extends Pizza{
	
	// field
	String bulgogiOrigin;	// 불고기 원산지
	
	// constructor
	BulgogiPizza(int cheese, String dough, String bulgogiOrigin){
		super(cheese, dough);
		this.bulgogiOrigin = bulgogiOrigin;
	}
	
	// method
	// Pizza 클래스에 info 메소드가 있지만,
	// BulgogiPizza 클래스는 info 메소드를 다시 만들어야 한다. (오버라이드)
	
	
	@Override
	// 치즈, 도우, 불고기 원산지 출력하기
	// 이 중에서 치즈, 도우 출력은 이미 Pizza 클래스의 info 메소드가 출력해놨었음
	void info() {
		super.info();
		System.out.println(bulgogiOrigin);
	}
	
}


public class Ex07_method_override {

	public static void main(String[] args) {
		
		BulgogiPizza pizza = new BulgogiPizza(100, "오리지널", "국내산");
		pizza.info();
		
		
	}

}
