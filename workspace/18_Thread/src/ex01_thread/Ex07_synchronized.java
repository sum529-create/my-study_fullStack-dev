package ex01_thread;

// 엄마: 거실청소	(스레드)
// 아빠: 방청소		(스레드)
// 청소도구 1개		(스레드에서 사용하는 자원)

// 사이좋게 한 번씩 Cleaner를 사용하도록
// 사용중에는(메소드 실행) 가져가지 못하도록 synchronized 처리
// synchronized
// 임계 영역 (critical section)
// 공유 데이터를 관리하기 위해서 한 번에 한 스레드의 접근만 허용

class Cleaner{
	public synchronized void livingRoomCleaning() throws Exception {
		System.out.println("거실청소중");
		System.out.println("거실청소완료");
		notify();			// 거실청소 끝났다고 다른 스레드()에게 알린다. notify시 아빠가 가젹나.
		System.out.println("방청소끝날때까지 기다림");
		wait();
	}
	public synchronized void roomCleaning() throws Exception {
		System.out.println("방청소중");
		System.out.println("거실청소완료");
		notify();			// 거실청소 끝났다고 다른 스레드()에게 알린다. notify시 아빠가 가젹나.
		System.out.println("거실청소끝날때까지 기다림");
		wait();
	}
}

class Mama extends Thread {
	
	private Cleaner cleaner;

	public Cleaner getCleaner() {
		return cleaner;
	}

	public void setCleaner(Cleaner cleaner) {
		this.cleaner = cleaner;
	}
	
	@Override
	public void run(){
		for(int i = 0; i<10; i++) {
			try {
				cleaner.livingRoomCleaning(); // 엄마는 거실청소기능 사용
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
		}
	}
	
}
class Papa extends Thread {
	private Cleaner cleaner;

	public Cleaner getCleaner() {
		return cleaner;
	}

	public void setCleaner(Cleaner cleancer) {
		this.cleaner = cleancer;
	}
	@Override
	public void run() {
		for(int i = 0; i<10; i++) {
			try {
				cleaner.livingRoomCleaning(); // 엄마는 거실청소기능 사용
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
		}
	}
}


public class Ex07_synchronized {

	public static void main(String[] args) {
		
		// Cleaner 1개
		Cleaner cleaner = new Cleaner();
		
		// 스레드 2개
		Mama mama = new Mama();
		Papa papa = new Papa();
		
		mama.setCleaner(cleaner);	// 엄마 청소기 들고,
		mama.start(); 				// 청소 시작
		
		papa.setCleaner(cleaner);	// 아빠 청소기 들고,
		papa.start(); 				// 청소 시작
	}

}
