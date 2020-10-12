package ex03_exception_quiz;

//1. 입금 예외
//1) 마이너스 입금 시 예외 발생
@SuppressWarnings("serial")
class DepositException extends Exception {
	// constructor
	public DepositException(String message) {  // 예외message를 받아온다.
		super(message);  // 받아온 예외message를 저장한다.
	}
	/*
	public DepositException(long money) {  // 예외money를 받아온다.
		super(money + "원은 입금이 불가능합니다.");  // 예외money로 예외message를 만들어 저장한다.
	}
	*/
}

//2. 출금 예외
//1) 마이너스 출금 시 예외 발생
//2) 통장잔고보다 큰 금액 출금 시 예외 발생
@SuppressWarnings("serial")
class WithdrawException extends Exception {
	// constructor
	public WithdrawException(String message) {
		super(message);
	}
}

//은행계좌
class BankAccount {
	
	// field
	private String accNo;  // 계좌번호
	private long balance;  // 통장잔고
	
	// constructor
	public BankAccount(String accNo, long balance) {
		super();
		this.accNo = accNo;
		this.balance = balance;
	}
	
	// method
	// 1. 입금: deposit
	public void deposit(long money) throws DepositException {
		if (money < 0) {
			throw new DepositException(money + "원은 입금이 불가능합니다.");
			// throw new DepositException(money);
		}
		balance += money;
	}
	// 2. 출금: withdraw
	// 1) 결과: 실제로 출금된 금액
	// 2) 매개변수: 출금 요청 금액
	public long withdraw(long money) throws WithdrawException {
		if (money < 0) {
			throw new WithdrawException(money + "원은 출금할 수 없습니다.");
		} else if (money > balance) {
			throw new WithdrawException("잔고가 부족합니다.");
		} else {
			balance -= money;
			return money;
		}
	}
	// 3. 조회: inquiry
	public void inquiry() {
		System.out.println(accNo + "(잔고: " + balance + "원)");
	}
	// 4. 이체: transfer
	public void transfer(BankAccount you, long money) throws WithdrawException, DepositException {
		// you에게 money를 보낸다.
		// 내 계좌의 withdraw 결과(실제 출금 금액)를 you 계좌의 deposit 인수로 사용
		you.deposit( withdraw(money) );
	}
}

public class Quiz03 {

	public static void main(String[] args) {
		
		BankAccount me = new BankAccount("123-456", 50000);
		BankAccount you = new BankAccount("654-321", 50000);
		
		try {
			// me.deposit(-5000);  // 예외상황1. 마이너스 입금
			// me.withdraw(-5000);  // 예외상황2. 마이너스 출금
			// me.withdraw(100000);  // 예외상황3. 잔고보다 큰 출금
			me.transfer(you, 50000);  // 정상동작 (예외상황확인)
			me.inquiry();   // 123-456(잔고: 0원)
			you.inquiry();  // 654-321(잔고: 100000원)
		} catch (DepositException e) {
			System.out.println(e.getMessage());
		} catch (WithdrawException e) {
			System.out.println(e.getMessage());
		}

	}

}