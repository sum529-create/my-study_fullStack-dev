import java.util.Random;


public class Test4 {

    public static void main(String[] args) {
	Random rand = new Random();
        int money = 10000;

        System.out.println("현재 " + money + "원이 있습니다.");

        while (true) {
		int n = rand.nextInt(money)+1;

            System.out.println(n + "원 사용합니다. 남은 돈은 " + (money -= n) + "원입니다.");

            if (money == 0) {

                break;

            }

        }

    }

}