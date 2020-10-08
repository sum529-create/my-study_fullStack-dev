package ex04_constructor;

/*
 * this() : 객체 자신의 생성자
 * 다른 코드보다 먼저 호출되어야 한다.
 */

class Book{
	String title;
	String author;
	int price;
	
	Book(String title, String author, int price){
		this.title = title;
		this.author = author;
		this.price = price;
	}
	Book(String title, int price){
		this(title, "미상", price);		// 매개변수가 3개 선언된 다른 생성자 호출
	}
	Book(String title, String author){
		this(title, author, 0);
	}
	void info(){
		System.out.print("제목 : " + title);
		System.out.print(", 저자 : " + author);
		System.out.print(", 가격 : " + price);
		System.out.println();
	}
}

public class Ex02_Book {

	public static void main(String[] args) {
		
		Book book1 = new Book("스프링5", "최범균", 26500);
		Book book2 = new Book("홍길동전", 15000);
		Book book3 = new Book("좋은생각", "박철수");
		
		book1.info();	// 제목 : 스프링5, 저자 : 최범균, 가격 : 26500
		book2.info();	// 제목 : 홍길동전, 저자 : 미상, 가격 : 15000
		book3.info();	// 제목 : 좋은생각, 저자 : 박철수, 가격 : 0

	}

}
