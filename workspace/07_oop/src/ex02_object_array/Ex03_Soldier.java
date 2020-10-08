package ex02_object_array;

class Gun{
	
	// field
	String model;
	int bullet;
	
	// constructor
	Gun(String model, int bullet){
		this.model = model;
		this.bullet = bullet;
	}
	
	// method
	void shoot() {
		if(bullet >0) {
			bullet --;
			System.out.println(model + "빵야! (" + bullet + "발 남음)");
		}else if(bullet == 0) {
			System.out.println(model + "총알이 없습니다.");
		}
	}
	
	void info() {
		System.out.println(model + "(" + bullet + "발)");
	}
	
	
}
class Soldier{
	String name;
	Gun[] gunList;
	int i;
	
	public Soldier(String name, int gunCount) {
		this.name = name;
		gunList = new Gun[gunCount];
	}

	public void addGun(Gun gun) {

		gunList[i++] = gun;
	}

	public void shoot() {	
		// 모든 총을 한 발씩 쏜다.
		// shoot을 호출하는 시점에 gun은 몇개가 있는가?
		// 호출시점에 따라 다르다.
		// 그럼에도 불구하고 답이 있다. : i개
		
		for(int i = 0; i < this.i; i++) {
			gunList[i].shoot();
		}
		
	}

	public void shoot(int i) {
		// gunNo : 1,2,3
		// 인덱스 : 0,1,2
		gunList[i-1].shoot();
		
	}

	public void shoot(String model) {
		for(int i = 0; i < this.i; i++) {	// Gun gun : gunList
			if(model == gunList[i].model) {	// model.equals(gun.model)
				gunList[i].shoot();			// gun.shoot();
			}
		}
	}

	public void info() {
		System.out.println("이름 : " + name);
		for(int i =0; i< gunList.length; i++) {
			gunList[i].info();
		}
	}
	
}

public class Ex03_Soldier {

	public static void main(String[] args) {
		
		Soldier soldier = new Soldier("람보", 3);	// Gun을 3개 가지고 있는 람보
		
		soldier.addGun(new Gun("콜트", 10));
		soldier.addGun(new Gun("베레타", 10));
		soldier.addGun(new Gun("스미스웨슨", 10));
		
		// 총 쏘는 방법이 3가지
		soldier.shoot();	// 모든 총을 한 발씩 쏜다.
		soldier.shoot(1);	// 1번째 총만 한 발 쏜다.
		soldier.shoot("베레타");	// 베레타만 한 발 쏜다.
		
		soldier.info();
		// 이름 : 람보
		// 콜트(8발)
		// 베레타(8발)
		// 스미스 웨슨(9발)

	}

}
