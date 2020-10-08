package choosuk;

import java.util.Scanner;

public class Ex06 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		
		String[] rsp = {"가위", "바위", "보"};

		int win = 0;
		int draw = 0;
		int lose = 0;
		
		while(true) {
			System.out.print("가위 바위 보! >> ");
			String user = sc.next();
			int rand = (int)(Math.random()*3);
			String computer = rsp[rand];
			if(user.equals("가위") && computer.equals("보") || 
					user.equals("바위") && computer.equals("가위") ||
					user.equals("보") && computer.equals("바위")) {
				System.out.println("사용자는 " + user + ", 컴퓨터는 " + computer + ", 이겼습니다!");
				win++;
			}else if(user.equals(computer)) {
				System.out.println("사용자는 " + user + ", 컴퓨터는 " + computer + ", 비겼습니다!");
				draw++;
			}else if(user.equals("그만")) {
				break;
			}else {
				System.out.println("사용자는 " + user + ", 컴퓨터는 " + computer + ", 졌습니다!");
				lose++;
			}
		}
		System.out.println("최종 전적: " + win + "승" + draw + "무" + lose + "패");
		
		sc.close();
	}

}
