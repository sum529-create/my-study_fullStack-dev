package ch7;

class Outer1 {

	static class Inner1 {

		int iv = 200;

	}

}

public class Exercise7_26 {

	public static void main(String[] args) {
		Outer1.Inner1 inner1 = new Outer1.Inner1();

		System.out.println(inner1.iv);

	}

}
