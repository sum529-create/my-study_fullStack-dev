package ex03_exception_quiz;

//errCode
//1. 마이너스 입금: 1000
//2. 마이너스 출금: 2000
//3. 잔고보다 큰 출금: 2001


//은행 예외
@SuppressWarnings("serial")
class BankException extends Exception {
	// field
	private int errCode;
	// constructor
	public BankException(int errCode, String message) {
		super(message);
		this.errCode = errCode;
	}
	// method
	public int getErrCode() {  // 에러코드 확인할 때 호출
		return errCode;
	}
	public void setErrCode(int errCode) {
		this.errCode = errCode;
	}
}

//입금 예외(은행 예외의 서브클래스)
@SuppressWarnings("serial")
class DepositException2 extends BankException {
	// constructor
	public DepositException2(String message) {
		super(1000, message);
	}
}

//출금 예외(은행 예외의 서브클래스)
@SuppressWarnings("serial")
class WithdrawException2 extends BankException {
	// constructor
	public WithdrawException2(int errCode, String message) {
		super(errCode, message);
	}
}

//은행 계좌
class Account {
	
	// field
	private String accNo;
	private long balance;

	// constructor
	public Account(String accNo, long balance) {
		super();
		this.accNo = accNo;
		this.balance = balance;
	}
	
	// method
	// 1. 입금
	public void deposit(long money) throws DepositException2 {
		if (money < 0) {
			throw new DepositException2(money + "원은 입금할 수 없습니다.");
		} else {
			balance += money;
		}
	}
	// 2. 출금
	public long withdraw(long money) throws WithdrawException2 {
		if (money < 0) {
			throw new WithdrawException2(2000, money + "원은 출금할 수 없습니다.");
		} else if (money > balance) {
			throw new WithdrawException2(2001, "잔고가 부족합니다.");
		} else {
			balance -= money;
			return money;
		}
	}
	// 3. 조회
	public void inquiry() {
		System.out.println(accNo + "(잔고: " + balance + "원)");
	}
	// 4. 이체
	public void transfer(Account you, long money) throws DepositException2, WithdrawException2 {
		you.deposit( withdraw(money) );
	}
	
}

public class Quiz04 {

	public static void main(String[] args) {
		
		Account me = new Account("123-456", 50000);
		Account you = new Account("654-321", 50000);
		
		try {
			me.transfer(you, -60000);
			you.inquiry();
		} catch (BankException e) {  // DepositException2, WithdrawException2 모두 저장
			System.out.println("에러코드: " + e.getErrCode());
			System.out.println("에러메시지: " + e.getMessage());
		}

	}

}