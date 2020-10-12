package ex03_exception_quiz;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
 * UpDownGame
 * 
 * 1. 1 ~ 100 사이의 난수를 사용자가 해당 난수를 맞히는 게임
 * 2. 몇 번만에 맞혔는지 게임 종료 시 출력
 * 3. 1 ~ 100 사이를 벗어난 값을 입력하면 NumberOutOfBoundsException 예외 발생
 *    예외 메시지 : 1 ~ 100 사이의 정수만 입력할 수 있습니다.
 */

class UpDownGame {
	// field
	private int answer;  // 발생된 난수
	private int count;   // 시도 횟수
	private Scanner sc;  // 입력 받을 sc (모든 메소드에서 sc 객체를 사용할 수 있다.)
	// constructor
	public UpDownGame() {
		answer = (int)(Math.random() * 100) + 1;
		count = 0;  // 생략 가능 (field는 자동으로 0으로 초기화)
		sc = new Scanner(System.in);
	}
	// method
	// 사용자가 1 ~ 100 값 입력
	// 사용자가 입력한 값을 리턴
	// NumberOutOfBoundsException 발생 가능
	public int challenge() throws InputMismatchException, NumberOutOfBoundsException {
		count++;  // 시도 횟수 증가
		System.out.print("1 ~ 100 사이의 정수를 입력하세요 >>> ");
		int n = sc.nextInt();  // InputMismatchException 발생 가능
		if (n < 1 || n > 100) {  // NumberOutOfBoundsException 발생
			// 사용자 예외는 throw 문으로 직접 던진다.
			throw new NumberOutOfBoundsException("1 ~ 100 사이만 입력이 가능합니다.");
		}
		return n;
	}
	public void play() {
		while (true) {  // 맞힐때까지 계속
			try {
				int n = challenge();
				if (n > answer) {
					System.out.println("Down!");
				} else if (n < answer) {
					System.out.println("Up!");
				} else {
					System.out.println("정답: " + answer + "(" + count + "번만에 정답)");
					sc.close();
					return;  // play() 종료
					// break;  // while (true) 종료 -> 이어서 play() 종료
				}
			} catch (InputMismatchException e) {
				System.out.println("정수만 입력할 수 있습니다.");
				// 정수가 아닌 입력은 challenge 메소드의 int n 에 전달되지 못하고,
				// 계속 입력스트림에 남아 있어서 제거해 줘야 한다.
				sc.next();  // 입력 받아 저장하는 곳은 없다.
			} catch (NumberOutOfBoundsException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}

@SuppressWarnings("serial")
class NumberOutOfBoundsException extends Exception {
	// constructor
	public NumberOutOfBoundsException(String message) {
		super(message);
	}
}

public class Quiz01 {

	public static void main(String[] args) {

		UpDownGame game = new UpDownGame();
		game.play();

	}

}