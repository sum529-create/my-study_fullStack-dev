package ex01_thread;

// Thread가 아닐 때
class Gun{
	
	private String model;
	private int bullet;
	
	public Gun(String model, int bullet) {
		super();
		this.model = model;
		this.bullet = bullet;
	}
	
	public void shoot() {
		for(int i = 1; i<=bullet; i++) {
			System.out.println(model + "(" + i + "발 쐈다.)");
		}
	}
	
}

public class Ex02_multi_thread {

	public static void main(String[] args) {
		// Thread가 아닌 Gun은 2개 이상이 동시에 shoot()메소드를 호출할 수 없다.
		Gun g1 = new Gun("콜트", 6);
		Gun g2 = new Gun("베레타", 10);
		
		g1.shoot();
		g2.shoot();
		
		

	}

}
