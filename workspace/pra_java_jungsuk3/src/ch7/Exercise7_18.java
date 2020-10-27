package ch7;

class Exercise7_18 {


	/* (1) action 메서드를 작성하시오. */
	private static void action(Robot r) {
		if(r instanceof DanceRobot) {	
			// 실제로 받아온 인스턴스가 어떤 것인지 알 수 없기에 
			// instanceof연산자를 통해 실제 인스턴스의 타입을 확인 할 수 있다.
			DanceRobot dr = (DanceRobot)r;
			dr.dance();
		}else if(r instanceof SingRobot) {
			SingRobot sr = (SingRobot)r;
			sr.sing();
		}else if(r instanceof DrawRobot) {
			DrawRobot dr = (DrawRobot)r;
			dr.draw();
		}
		
	}


	public static void main(String[] args) {
		Robot[] arr = { new DanceRobot(), new SingRobot(), new DrawRobot() };
		for (int i = 0; i < arr.length; i++)
			action(arr[i]);

	} // main


}


class Robot {

}


class DanceRobot extends Robot {
	void dance() {
		System.out.println("춤을 춥니다.");
	}
}


class SingRobot extends Robot {
	void sing() {
		System.out.println("노래를 합니다.");
	}
}


class DrawRobot extends Robot {
	void draw() {
		System.out.println("그림을 그립니다.");

	}
}