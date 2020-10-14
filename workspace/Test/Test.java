// 문제. 정수를 입력 받아서 출력하시오.
import java.util.Scanner;
import java.util.*;

public class Test{	// 클래스명 = 파일명
	public static void main(String[ ] args){
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력하시오 >> ");
		int a = sc.nextInt();
		System.out.println("입력된 정수는 " + a + "입니다.");
		sc.close();
	}
}