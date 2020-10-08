package ex02_user_type;

public class MainClass2 {

	public static void main(String[] args) {
		
		// Computer 생성
		Computer myCom = new Computer();
		
		// save 메소드 호출
		myCom.save("GRAM", "LG", 180);
			
		// info 메소드 호출
		// myCom.info();
		
		Book myBook = new Book();
		myBook.setInfo("어린왕자", "생떽쥐베리", 15000, 10000);
		// myBook.print();
		
		Person p = new Person();
		
		p.save("제임스", 24, "여자", 162.5, myCom, myBook);
		p.info();
	}

}
