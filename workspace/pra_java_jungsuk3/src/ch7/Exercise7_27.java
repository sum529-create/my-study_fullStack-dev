package ch7;

class Outer2 {

	int value = 10;



	class Inner2 {

		int value = 20;



		void method1() {

			int value = 30;

			System.out.println(value);

			System.out.println(this.value);

			System.out.println(Outer2.this.value);

		} // Inner 클래스의 끝

	}// Outer클래스의 끝

}

public class Exercise7_27 {

	public static void main(String[] args) {
		/* (4) 알맞은 코드를 넣어 완성하시오 . */

		Outer2 outer2 = new Outer2();
		Outer2.Inner2 inner2 = outer2.new Inner2(); 
		inner2.method1();
	}

}
