package ex01_oop;

class BreadAndChange {
	
	// field
	int bread;
	int change;
	
	// constructor
	BreadAndChange(int bread, int change) {
		this.bread = bread;
		this.change = change;
	}
	
}


class Bakery {
	
	// field
	int breadCount;
	int breadPrice;
	int bakeryMoney;
	
	// constructor
	Bakery(int breadCount, int breadPrice, int bakeryMoney) {
		this.breadCount = breadCount;
		this.breadPrice = breadPrice;
		this.bakeryMoney = bakeryMoney;
	}
	
	// method
	// 1. sell (판매)
	// 빵과잔돈 sell(고객돈) {  }
	BreadAndChange sell(int customerMoney) {
		
		// 판매할 빵 개수
		int sellBread = customerMoney / breadPrice;
		// 잔돈
		int change = customerMoney % breadPrice;
		// 고객에게 돌려 줄 BreadAndChange 객체 생성
		BreadAndChange bnc = new BreadAndChange(sellBread, change);
		
		// Bakery 판매처리 (빵은 줄었고, 돈은 늘었다.)
		breadCount -= sellBread;
		bakeryMoney += (customerMoney - change);
		
		// 고객에게 빵과잔돈 전달
		return bnc;
		
	}
	
	// 2. info
	void info() {
		System.out.println("빵" + breadCount + "개, 자본금" + bakeryMoney + "원");
	}
	
}


class Customer {
	
	// field
	int customerBread;
	int customerMoney;
	
	// constructor
	Customer(int customerMoney) {
		this.customerMoney = customerMoney;
	}
	
	// method
	// buy
	// 1) 결과타입 : void
	// 2) 메소드명 : buy
	// 3) 매개변수 : Bakery bakery, int customerMoney
	void buy(Bakery bakery, int customerMoney) {
		
		// bakery에 customerMoney를 전달하고, 빵과잔돈을 받는다.
		BreadAndChange bnc = bakery.sell(customerMoney);
		
		// 받은 빵과잔돈 처리
		this.customerBread += bnc.bread;
		this.customerMoney += bnc.change;
		
		// 고객돈 줄었다.
		this.customerMoney -= customerMoney;
		
		System.out.println("가진빵" + this.customerBread + "개, 남은돈" + this.customerMoney + "원");
		
	}
	
}


public class Ex10_Bakery {

	public static void main(String[] args) {
		
		Bakery paris = new Bakery(100, 500, 10_000);	// 빵100개, 빵하나500원, 자본금10_000원
		Bakery tour = new Bakery(50, 1_000, 10_000);	// 빵50개, 빵하나1_000원, 자본금10_000원

		Customer customer = new Customer(20_000);  // 가진돈20_000원
		
		// 첫 번째 빵집 방문
		customer.buy(paris, 10_000);  // 가진빵20개, 남은돈10_000원
		
		// 두 번째 빵집 방문
		customer.buy(tour, 10_000);   // 가진빵30개, 남은돈0원
		
		// 첫 번째 빵집 상황
		paris.info();  // 빵80개, 자본금20_000원
		
		// 두 번째 빵집 상황
		tour.info();   // 빵40개, 자본금20_000원
		
	}

}