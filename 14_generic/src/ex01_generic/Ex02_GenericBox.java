package ex01_generic;

// 무엇이든 담을 수 있는 GenericBox
// GenericBox를 생성할때 저장할 데이터의 타입을 미리 결정

class GenericBox<T>{ // T : 저장할 데이터의 타입을 의미, GenericBox가 생성될때 어떤 타입인지 전달된다. 
					// 관습상 대문자, 다른 문자로도 사용 가능함 A
	// field
	private T item;
	// constructor
	// 생략해도 new GenericBox() 가능
	
	// method
	public T getItem() {
		return item;
	}

	public void setItem(T item) {
		this.item = item;
	}
	
	
}

// 담을 물건
class Computer{}
class Book{}

public class Ex02_GenericBox {

	public static void main(String[] args) {
		// GenericBox의 생성(가장중요)
		// 생성할 때 저장할 데이터의 타입을 전달해야한다.
		
//		GenericBox<Book> box = new GenericBox<Book>();
		GenericBox<Book> box = new GenericBox<>();	// 최근 추세(위와같은 코드 -> 뒤쪽생략, 앞은 x)
		
		// 바로 위 생성시점에 GenericBox 클래스는 아래와 같이 변경된다.
		
		class GenericBox<T>{
			private T item;
			public T getItem() {
				return item;

			}
			public void setItem(T item) {
				this.item = item;
			}
		}
		// box에 Book을 저장한다.
		box.setItem(new Book());	// 정상
		
		// box에 Computer를 지정한다.
//		box.setItem(new Computer());	// 비정상 (ObjectBox에서는 되던 작업)
		
		// box에 저장된 item꺼내기
		Book book = box.getItem();	// 정상, 캐스팅이 필요없다.
		
		// box에 저장된 item 꺼내기
//		Computer com = box.getItem();	// 비정상 (ObjectBox에서는 되던 작업)
		
		// 정수를 담을 수 있는 GenericBox 생성
		// generic 처리 시 "기본 자료형(int)"은 사용이 불가하다.
		// 대신 Wrapper Class(Integer, Double 등)를 사용한다.
		
		// GenericBox<int> box2 = new GenericBox<>();
		GenericBox<Integer> box2 = new GenericBox<>();
		
		box2.setItem(100);			// (100) -> Integer item (Auto Boxing)
		int n = box2.getItem();		// int n = Integer (Auto UnBoxing)
		
		System.out.println();
		
	}
	

}
