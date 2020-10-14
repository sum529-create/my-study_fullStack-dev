import java.util.Scanner;

 

public class Test1 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("정수를 입력하세요 >> ");

        int a;

        a = sc.nextInt();

        if ( a%3 == 0 ) {

            System.out.println(a + "는 3의 배수이다.");

        } else if ( a%2 == 0 ) {

           System.out.println(a + "는 짝수이다.");

        } else {

          System.out.println(a + "는 홀수이다.");

       }

       sc.close();

    }

}