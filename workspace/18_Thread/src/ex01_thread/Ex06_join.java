package ex01_thread;

class Adder extends Thread{
	
	// from 부터 to까지 모든 정수의 합을 반환
	private int from;
	private int to;
	private int total;
	
	
	public Adder(int from, int to) {
		super();
		this.from = from;
		this.to = to;
		this.total = 0;		// 생략 가능
	}
	
	public int getTotal() {
		return total;
	}
	
	public void addition() {
		for(int n = from; n <= to; n++) {
			total += n;
			
		}
		System.out.println("adder 합: " + total);
	}
	
	@Override
	public void run() {
		addition();
		
	}
	
}

public class Ex06_join {
	
	// join()메소드의 예외 처리를
	// main이 직접하지 않고, (try-catch 안했다)
	// main을 호출하는 곳으로 예외 처리를 맡긴다.
	// main 호출은 JVM이 담당하므로 예외는 JVM이 처리한다.

	public static void main(String[] args) throws Exception{
		Adder adder1 = new Adder(1, 10);
		Adder adder2 = new Adder(11, 100);
		
		adder1.start();	// run()이 호출되면 addition()이 호출된다.
		adder2.start();
		
		// main은 adder1 스레드와 adder2 스레드를 시작시키고 곧바로 종료된다.
		// adder1 스레드와 adder2 스레드가 끝날 때까지 기다려야만
		// main에서 adder1의 합계 결과와 adder2의 합계 결과를 알 수있다.
		
		// 전체합이 0출력됨 ?
		// join() 메소드
		// join을 호출한 스래드와 함께 하기 위해서 스레드의 종료까지 기다린다.
		// 예외 처리를 해야 한다. (try-catch, throws)
		
		adder1.join(); 		// adder1과 함께 하기 위해 끝날때까지 기다린다.
		adder2.join();
		
		System.out.println("전체 합 : " + (adder1.getTotal() + adder2.getTotal())); 
		
		
	}

}
