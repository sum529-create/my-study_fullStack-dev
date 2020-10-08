package ex01_user_type;

// 클래스 book
// 제목, 저자, 가격, 판매량, 베스트 셀러 유무(판매량이 1000 이상은 베스트 셀러)

class book{
	
	// 필드는 자동으로 초기화된다.
	
	String sub;
	String author;
	int price;
	int count;
	boolean best;
}

public class Ex02_Book {

	public static void main(String[] args) {
		
		book bestSell = new book(); 
		
		bestSell.sub = "책";
		bestSell.author = "코야";
		bestSell.price = 10000;
		bestSell.count = 1000;
		

		bestSell.best = bestSell.count <= 1000;
		System.out.println(bestSell.sub);
		System.out.println(bestSell.author);
		System.out.println(bestSell.price);
		System.out.println(bestSell.count);
		System.out.println(bestSell.best? "베스트 셀러" : "일반서적");
		

	}

}
