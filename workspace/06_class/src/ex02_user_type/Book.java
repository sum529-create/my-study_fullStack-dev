package ex02_user_type;

public class Book {
	String title;
	String author;
	int price;
	int amount;
	boolean isBestSeller;
	
	// method
	// 1. 필드 정보 출력 메소드
	// 		1) 결과타입 : void
	//		2) 메소드명 : print
	//		3) 매새변수 : 없음
	
	void print() {

		System.out.println("책 제목 : " + title);
		System.out.println("책 작가 : " + author);
		System.out.println("책 가격 : " + price + "원");
		System.out.println("판매량 : " + amount + "권");
		System.out.println(isBestSeller? "베스트 셀러" : "일반서적");
	}
	
	// 2. 필드 정보를 저장하는 메소드
	// 		1) 결과타입 : void
	//		2) 메소드명 : setInfo
	//		3) 매새변수 : String t, String a, int p, int amt
	
	void setInfo(String t, String a, int p, int amt) {
		title = t;
		author = a;
		price = p;
		amount = amt;
		isBestSeller = amt >= 1000;
	}
	
}
