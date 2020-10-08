package ex01_oop;

class BankAccount{
	String account;
	long money;

	public BankAccount(String account, long money) {
		this.account = account;
		this.money = money;
	}

	public void deposit(long money) {
		if (money > 0) {
			this.money += money;
		}else {
			return;
		}
		
	}

	long withdraw(long money) {
		if ((this.money-money) < 0) {
			return 0;
		}else {
			this.money -= money;
		}
		return money;
		
	}

	public void inquiry() {
		System.out.println("계좌번호 : " + account + ", 잔액 : " + money + "원");
		
	}

	public void tranfer(BankAccount me, long money) {
		if((this.money - money) < 0 || money < 0) {
			return;
		}else {
			me.deposit(money);
			withdraw(money);
		}
	}
	
}

public class Ex09_BankAccount {

	public static void main(String[] args) {
		
		BankAccount me = new BankAccount("1234", 10_000);
		BankAccount mom = new BankAccount("4321", 100_000);
		
		me.deposit(10_000);	// 내 계좌에 10_000원 입금
		me.deposit(-100);	// 내 계좌에 마이너스 입금 (불가)
		
		me.withdraw(20_000);	// 내 계좌에서 20_000 출금
		me.withdraw(100);	// 내 계좌에서 잔액보다 큰 금액 출금 안됨
		
		me.inquiry();	// 계좌번호 : 1234, 잔액 : 0원
		
		// 여기까지 1단계
		System.out.println();
		
		mom.tranfer(me, 50_000);	// 엄마가 나에게 50_000 이체
		mom.tranfer(me, -100); 		// 실패 
		mom.tranfer(me, 100_000_000); 	// 실패
		
		mom.inquiry();
		me.inquiry();
		
		// 여기까지 2단계
		
	}

}
