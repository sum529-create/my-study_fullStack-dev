package ex01_generic;

// 무엇이든 담을 수 있는 ObjectBox
class ObjectBox{
	// field
	private Object obj;
	// constructor
	// 안 만들어도 new ObjectBox() 생성가능
	// method
	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}
	
}

// 담을 객체
class Keyboard {}
class Mouse { }

public class Ex01_ObjectBox {

	public static void main(String[] args) {
		
		ObjectBox box = new ObjectBox();
		
		// box에 keyboard 담기
		box.setObj(new Keyboard());
		
		// box에 Mouse담기
		box.setObj(new Mouse());

		// box에 저장된 걸 꺼내 보기
		@SuppressWarnings("unused")
		Mouse mouse = (Mouse)box.getObj();	// 정상
		
		// box에 저장된 걸 다시 꺼내 보자.
		@SuppressWarnings("unused")
		Keyboard keyboard = (Keyboard)box.getObj();	// 비정상
		
		// Object를 사용하면
		// 캐스팅 대부분 함께 하는데,
		// 잘못된 캐스팅을 하더라도 오류가 발생하지 않는다. (실행 시 오류)
		
	}

}
